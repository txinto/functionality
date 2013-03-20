class HoboMigration3 < ActiveRecord::Migration
  def self.up
    add_column :functions, :description, :text
  end

  def self.down
    remove_column :functions, :description
  end
end
