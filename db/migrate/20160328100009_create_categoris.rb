class CreateCategoris < ActiveRecord::Migration
  def change
    create_table :categoris do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
