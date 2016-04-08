class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.string :category_id
      t.timestamps
    end
  end
end
