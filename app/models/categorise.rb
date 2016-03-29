class Categorise < ActiveRecord::Base
  belongs_to :repositories
  belongs_to :categori
  include PgSearch
end
