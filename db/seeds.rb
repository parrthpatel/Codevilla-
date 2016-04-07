# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
99.times do |n|
  name  = Faker::Name.name
  html_url = "railstutorial#{n+1}.org"
  password = "password"
  Repository.create!(name: name,
  				github_profile_nickname: name,
  				html_url: html_url,
  				clone_url: html_url)
end

Category.create [{:name => 'E-Commerce'}, 
				 {:name => 'Game-2D'}, 
				 {:name => 'Game-3D'}, 
				 {:name => 'Template'}, 
				 {:name => 'Scripts'}, 
				 {:name => 'MVC'}, 
				 {:name => 'MTV'}, 
				 {:name => 'Mobile Application'}, 
				 {:name => 'Stand-Alone App'}, 
				 {:name => 'Driver'}, 
				 {:name => 'Data-Analysis'}, 
				 {:name => 'Data Storage'}, 
				 {:name => 'Cloude'} ]