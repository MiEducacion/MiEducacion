class CreateSettingsSecurities < ActiveRecord::Migration[7.0]
    def self.up
      create_table :settings_securities do |t|
        t.string :var, null: false
        t.text :value, null: true
  
        t.timestamps
      end
  
      add_index :settings_securities, :var, unique: true
    end
  
    def self.down
      drop_table :settings_securities
    end
  end