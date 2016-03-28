class AddAmountToRepositories < ActiveRecord::Migration
  def change
    add_column :repositories, :amount, :integer
  end
end
