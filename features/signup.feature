Feature: Sign up
  In order to access showroom
  I want to be able to sign up

  Scenario: Sign up as a user
    Given I go to the sign up page
    And I fill in "Email" with "user1@test.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Sign up"
    Then I should see "Welcome! You have signed up successfully"


