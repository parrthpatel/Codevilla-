class CreateJoinTableCategoryRepository < ActiveRecord::Migration
  def change
    create_join_table :categories, :repositories, column_options: {null: true} do |t|
      # t.index [:category_id, :repository_id]
      # t.index [:repository_id, :category_id]
    end
  end
end
