class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.text :detail, null: false
      t.integer :item_category_id, null: false
      t.integer :item_sale_status_id, null: false
      t.integer :fee_status_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :scheduled_delivery_id, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
