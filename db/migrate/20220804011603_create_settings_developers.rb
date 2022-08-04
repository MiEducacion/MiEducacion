class CreateSettingsDevelopers < ActiveRecord::Migration[6.1]
    def self.up
      create_table :settings_developers do |t|
        t.string :var, null: false
        t.text :value, null: true
  
        t.timestamps
      end
  
      add_index :settings_developers, :var, unique: true
    end
  
    def self.down
      drop_table :settings_developers
    end
  end