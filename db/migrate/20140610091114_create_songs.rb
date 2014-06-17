class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
			t.string :name
			t.string :composer
			t.references :movie	#foreign key	creates movie_id
      t.timestamps
    end
  end
end
