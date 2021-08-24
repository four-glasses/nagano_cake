class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :image_id
      t.integer :non_taxed_price
      t.boolean :sales_status, default: false, null: false
      t.text :items_explanation

      t.timestamps
    end
  end
end
