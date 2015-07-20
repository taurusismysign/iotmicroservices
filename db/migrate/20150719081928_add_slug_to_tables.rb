class AddSlugToTables < ActiveRecord::Migration
  def change
    add_column :tweets, :category_string, :string
    add_column :categories, :category_string, :string
    add_column :experts, :category_string, :string

    remove_column :experts, :category_id, :integer
    remove_column :tweets, :category_id, :integer
  end
end
