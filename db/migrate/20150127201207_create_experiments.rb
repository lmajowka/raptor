class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.string :title, null: false
      t.string :status, null: false, default: 'draft'
      t.datetime :published_until
      t.string :country_code
      t.timestamps
    end
  end

  def down
    drop_table :experiments
  end
end
