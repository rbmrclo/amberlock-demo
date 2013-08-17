class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :band
      t.string :bio
      t.string :genre

      t.timestamps
    end
  end
end
