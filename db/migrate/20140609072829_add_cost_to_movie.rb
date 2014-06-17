class AddCostToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :cost, :integer
  end
end
