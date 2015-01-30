class CreateChanges < ActiveRecord::Migration
  def change
    create_table :changes do |t|
      t.references :variation, index: true, null: false
      t.string :selector, null: false
      t.string :content
      t.string :css_text
      t.timestamps
    end
  end

  def down
    drop_table :changes
  end
end

