class CreateCategorises < ActiveRecord::Migration
  def change
    create_table :categorises do |t|
      t.belongs_to :repository, index: true, foreign_key: true
      t.belongs_to :categori, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
