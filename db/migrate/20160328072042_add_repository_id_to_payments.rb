class AddRepositoryIdToPayments < ActiveRecord::Migration
  def change
    add_reference :payments, :repository, index: true, foreign_key: true
  end
end
