class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.integer :views, default: 0
      t.references :user, index: true, foreign_key: true
      
      t.timestamps
    end
  end
end
