class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.text :content
      t.string :author
      t.string :company
      t.integer :position, null: false, default: 0

      t.timestamps null: false
    end

    add_index :testimonials, :position
  end
end
