def path_to(page_name)
  case page_name

  when /the homepage/
    root_path

  when /the sign in page/
    new_user_session_path

  when /the sign up page/
    new_user_registration_path

  when /the new product page/
    new_product_path

  when /the showroom page/
    showroom_path

  # Add more page name => path mappings here

  else
    raise "Can't find mapping from \"#{page_name}\" to a path."
  end
end

