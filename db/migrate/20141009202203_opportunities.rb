class Opportunities < ActiveRecord::Migration
  def change
    change_column :opportunities, :description, :text
  end
end
