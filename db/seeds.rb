# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

user = User.find_or_create_by_email(:email => 'caitlinss@gmail.com', :password => 'Katama12',
                                    :password_confirmation => 'Katama12')
user.admin = true
user.save!
