Feature: Products management
  In order to manage products
  I want to be able to add, edit and delete products

  Scenario: Add product
    Given the following admin exists:
      | admin1@test.com | secure |
    And I sign in as "admin1@test.com" with password "secure"
    And I go to the new product page
    And I fill in "Name" with "Test product"
    And I fill in "Price" with "1.23"
    And I fill in "Description" with "Test description"
    And I attach the file "spec/factories/files/image1.jpeg" to "Image"
    And I press "Add"
    Then I should see "Test product"

  Scenario: Update product
    Given the following admin exists:
      | admin1@test.com | secure |
    And I have the product:
      | name | Cucumber product |
      | description | Cucumber description |
      | price | 12.99 |
      | image | spec/factories/files/image2.jpeg |
    And I sign in as "admin1@test.com" with password "secure"
    And I visit the product "Cucumber product" edit page
    And I fill in "Name" with "Test updated product"
    And I fill in "Price" with "3.45"
    And I fill in "Description" with "Test updated description"
    And I attach the file "spec/factories/files/image2.jpeg" to "Image"
    And I press "Update"
    Then I should see "Test updated product"

