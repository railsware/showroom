# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)


# regular users
%w{test1@test.com test2@test.com test3@test.com}.each do |email|
  unless User.find_by_email(email)
    user = User.new(email: email, password: "password", password_confirmation: "password")
    user.role = "user"
    user.save!
  end
end

# admins
%w{admin1@test.com admin2@test.com}.each do |email|
  unless User.find_by_email(email)
    user = User.new(email: email, password: "secure", password_confirmation: "secure")
    user.role = "admin"
    user.save!
  end
end