Feature: Showroom access
  In order to make some purchases
  As a signed in user
  I want to be able to access my showroom

  Scenario: Get showroom
    Given the following user exists:
      | user1@test.com | password |
    And I have the product:
      | name | Cucumber product |
      | description | Cucumber description |
      | price | 12.99 |
      | image | spec/factories/files/image2.jpeg |
    And I sign in as "user1@test.com" with password "password"
    And I visit the showroom's product "Cucumber product"
    Then I should see "Cucumber product"


