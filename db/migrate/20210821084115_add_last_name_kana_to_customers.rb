class AddLastNameKanaToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :last_name_kana,  :string
    add_column :customers, :first_name_kana, :string
    add_column :customers, :last_name,       :string
    add_column :customers, :first_name,      :string
    add_column :customers, :telephone,       :string
    add_column :customers, :postal_code,     :string
    add_column :customers, :address,         :string
    add_column :customers, :is_deleted,      :boolean, default: false, null: false

    change_column_null :customers, :last_name_kana,  false
    change_column_null :customers, :first_name_kana, false
    change_column_null :customers, :last_name,       false
    change_column_null :customers, :first_name,      false
    change_column_null :customers, :telephone,       false
    change_column_null :customers, :postal_code,     false
    change_column_null :customers, :address,         false
  end
end
