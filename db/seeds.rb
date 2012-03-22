# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

# products
%w{Pilar Lorna Hilary}.each do |name|
  %w{20 40 99.9}.each do |price|
    %w{image1 image2 image3}.each do |image|
      Product.create!(
        name: name, 
        price: price,
        image: File.open(File.join(Rails.root, "spec", "factories", "files", "#{image}.jpeg")), 
        description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
    end
  end
end

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