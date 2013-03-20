class HoboMigration2 < ActiveRecord::Migration
  def self.up
    add_column :functions, :ident, :string
  end

  def self.down
    remove_column :functions, :ident
  end
end
