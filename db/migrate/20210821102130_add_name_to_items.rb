class AddNameToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :name,              :string
    add_column :items, :image_id,          :string
    add_column :items, :non_taxed_price,   :integer
    add_column :items, :sales_status,      :boolean, default: true, null: false
    add_column :items, :items_explanation, :text

    change_column_null :items, :name,              false
    change_column_null :items, :image_id,          false
    change_column_null :items, :non_taxed_price,   false
    change_column_null :items, :items_explanation, false
  end
end
