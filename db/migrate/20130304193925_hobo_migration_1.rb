class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :functions do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :sub_system_id
    end
    add_index :functions, [:sub_system_id]

    create_table :sub_systems do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :functions
    drop_table :sub_systems
  end
end
