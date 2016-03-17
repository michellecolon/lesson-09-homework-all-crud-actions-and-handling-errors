class AddModifyToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :modify, :string
  end
end
