Feature: Sign in
  In order to access showroom
  I want to be able to authenticate

  Scenario: Sign in as a user
    Given I go to the sign in page
    And the following user exists:
      | user1@test.com | password |
    And I fill in "Email" with "user1@test.com"
    And I fill in "Password" with "password"
    And I press "Sign in"
    Then I should see "Your Showroom"

  Scenario: Sign in as a admin
    Given I go to the sign in page
    And the following admin exists:
      | admin1@test.com | secure |
    And I fill in "Email" with "admin1@test.com"
    And I fill in "Password" with "secure"
    And I press "Sign in"
    Then I should see "Products"

  Scenario: Sign in error
    Given I go to the sign in page
    And I fill in "Email" with "user1@test.com"
    And I fill in "Password" with "password"
    And I press "Sign in"
    Then I should see "Invalid email or password"

