When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^the following (user|admin) exists:$/ do |role, fields|
  fields.rows_hash.each do |email, password|
    Factory.create(role, :email => email.dup, :password => password.dup, :password_confirmation => password.dup)
  end
end

When /^(?:|I )have the product:$/ do |fields|
  product = Factory.build(:product)
  fields.rows_hash.each do |field, value|
    unless field == 'image'
      product.send("#{field}=", value)
    else
      product.image = File.open(value)
    end
  end
  product.save!
end

When /^(?:|I )I visit the showroom's product "([^"]*)"$/ do |name|
  product = Product.find_by_name(name)
  ps = ProductsShowroom.new
  ps.product = product
  ps.showroom = User.first.showrooms.find_current
  ps.save!
  visit showroom_product_path(product)
end

When /^(?:|I )visit the product "([^"]*)" edit page$/ do |name|
  product = Product.find_by_name(name)
  visit edit_product_path(product)
end

When /^(?:|I )attach the file "(.*)" to "(.*)"$/ do |path, field|
  attach_file(field, path)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )sign in as "([^"]*)" with password "([^"]*)"$/ do |email, password|
  visit '/signin'
  fill_in 'Email', :with => email
  fill_in 'Password', :with => password
  click_button 'Sign in'
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end

When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

