class CreateCampus < ActiveRecord::Migration[6.1]
  def change
    create_table :campus do |t|
      t.integer :post_id
      t.string :owner_id
      t.text :raw_body

      t.timestamps
    end
  end
end
