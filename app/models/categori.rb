class Categori < ActiveRecord::Base
	has_many :categorises
    has_many :repositories, through: :categorises
end
