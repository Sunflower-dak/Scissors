class CreateUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :urls do |t|
      t.string :url
      t.string :title
      t.string :description
      t.integer :views_count, default: 0

      # t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
