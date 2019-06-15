class AddtitletoBooks < ActiveRecord::Migration[5.2]
  def change
  	add_column :books, :title, :string
  	add_column :books, :body, :string
  	add_column :books, :user_id, :intger
  end
end
