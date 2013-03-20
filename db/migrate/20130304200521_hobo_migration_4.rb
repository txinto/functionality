class HoboMigration4 < ActiveRecord::Migration
  def self.up
    create_table :function_types do |t|
      t.string   :name
      t.text     :description
      t.float    :estimated_days
      t.datetime :created_at
      t.datetime :updated_at
    end

    add_column :functions, :function_type_id, :integer

    add_index :functions, [:function_type_id]
  end

  def self.down
    remove_column :functions, :function_type_id

    drop_table :function_types

    remove_index :functions, :name => :index_functions_on_function_type_id rescue ActiveRecord::StatementInvalid
  end
end
