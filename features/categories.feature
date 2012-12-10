Feature: Add or edit categories
  As a blog administrator
  In order to manage articles by categories
  I want to be able to add or edit categories

  Background:
    Given the blog is set up
    And I am logged in as "admin"

  Scenario: Admin can merge articles
    When I follow "Categories"
    Then I should be on the new categories page
    And I should see "Name"
    And I should see "Keywords"
    And I should see "Permalink"
    And I should see "Description"