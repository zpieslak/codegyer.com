class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.text :short_content
      t.text :content
      t.text :features
      t.integer :images_count, null: false, default: 0
      t.date :date_at
    end

    add_index :projects, :slug
  end
end
