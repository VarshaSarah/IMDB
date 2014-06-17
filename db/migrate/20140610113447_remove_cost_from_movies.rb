class RemoveCostFromMovies < ActiveRecord::Migration
  def change
    remove_column :movies, :cost, :integer
  end
end
