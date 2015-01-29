class AddUrlToExperiments < ActiveRecord::Migration
  def up
    add_column :experiments, :url, :string
  end

  def down
    remove_column :experiments, :url
  end
end
