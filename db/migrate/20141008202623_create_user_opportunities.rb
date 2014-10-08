class CreateUserOpportunities < ActiveRecord::Migration
  def change
    create_table :user_opportunities do |t|

      t.timestamps
    end
  end
end
