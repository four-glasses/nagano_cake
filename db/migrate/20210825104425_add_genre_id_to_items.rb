class AddGenreIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column         :items, :genre_id, :integer

    change_column_null :items, :genre_id, false
  end
end
