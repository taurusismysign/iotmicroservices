class CreateExperts < ActiveRecord::Migration
  def change
    create_table :experts do |t|

      t.string :handle
      t.integer :category_id
      t.timestamps null: false
    end
  end
end
