class VolunteerMatchApi

  def initialize
    @account_name = ENV['vm_account']
    @api_key      = ENV['vm_key']
  end

  def find_events_by_location(location)
    call :searchOpportunities, { location: location, radius: "10",
       dateRanges: [{startDate: formatted_date_today, endDate: today_plus_thirty }] }.to_json
  end

  def formatted_date_today
    Date.today.strftime("%Y-%m-%d")
  end

  def today_plus_thirty
    date = Date.today + 30
    date.strftime("%Y-%m-%d")
  end


  protected

  def call(action, json_query)
    nonce           = Digest::SHA2.hexdigest(rand.to_s)[0, 20]
    creation_time   = Time.now.utc.strftime("%Y-%m-%dT%H:%M:%S%z")
    password_digest = Base64.encode64(Digest::SHA2.digest(nonce + creation_time + @api_key)).chomp
    url             = URI.parse("http://www.volunteermatch.org/api/call?action=#{action.to_s}&query=" + URI.encode(json_query))

    req             = Net::HTTP::Get.new(url.request_uri)
    req.add_field('Content-Type', 'application/json')
    req.add_field('Authorization', 'WSSE profile="UsernameToken"')
    req.add_field('X-WSSE', 'UsernameToken Username="' + @account_name + '", PasswordDigest="' + password_digest + '", ' +
        'Nonce="' + nonce + '", Created="' + creation_time + '"')

    res = Net::HTTP.new(url.host, url.port).start { |http| http.request(req) }
    raise "HTTP error code #{res.code}" unless res.code == "200"
    JSON.parse(res.body)
  end

end
