class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.integer :group_id
      t.text :name
      t.string :image
      t.string :owner_id
      t.boolean :private

      t.timestamps
    end
  end
end
