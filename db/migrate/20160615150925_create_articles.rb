class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.boolean :published, default: false
      t.integer :writer_id, null: false
      t.references :group, null: false

      t.timestamps null: false
    end
  end
end
