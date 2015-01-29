class CreateVariations < ActiveRecord::Migration
  def change
    create_table :variations do |t|
      t.references :experiment, index: true, null: false
      t.string :title, null: false
      t.string :population_logic, null: false
      t.timestamps
    end
  end

  def down
    drop_table :variations
  end
end
