class CreateOpportunities < ActiveRecord::Migration
  def change
    create_table :opportunities do |t|
      t.string :organization_name
      t.timestamps
    end
  end
end
