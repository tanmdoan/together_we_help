class AddConfirmedToOpportunities < ActiveRecord::Migration
  def change
    add_column :opportunities, :confirmed, :boolean, default: false
  end
end
