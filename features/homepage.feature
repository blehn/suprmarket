@home
Feature: Homepage
  In order to have a seamless user experience
  As a user
  I want to be able to access the home page
  
  Scenario: Guest visits homepage
    Given I am a guest
    When I go to the homepage
    Then I should see "Login"
    And I should see "Join"
    
  Scenario: User visits homepage
    Given I have signed in with "matt@test.com/toast"
    When I go to the homepage
    Then I should see "Welcome"
    And I should see "Logout"