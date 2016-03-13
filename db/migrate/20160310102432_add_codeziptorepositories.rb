class AddCodeziptorepositories < ActiveRecord::Migration
  def change
  	add_column :repositories, :codezip, :string
  end
end
