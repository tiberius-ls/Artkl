class AddViewsToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :views, :integer, default: 0
  end
end
