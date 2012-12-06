Feature: Merge Articles
  As a blog administrator
  In order to avoid multiple articles being on the same topic
  I want to be able to merge them into one article

  Background:
    Given the blog is set up

  Scenario: A non-admin cannot merge articles
    Given I am logged in as "user"
    And I am editing an existing article
    Then I should not see "Merge Articles"

  Scenario: Admin can merge articles
    Given I am logged in as "admin"
    And I am editing an existing article
    Then I should see "Merge Articles"

  Scenario: A merged article contains the text of source articles
    Given I am logged in as "admin"
    And I've published an article "Foobar" with body "Lorem Ipsum"
    And I've published an article "Foobar2" with body "Michael Jordan"
    When I follow "Foobar"
    And I fill in "merge_with" with "3"
    And I press "Merge"
    Then I should be on the admin content page
    And I should not see "Foobar2"
    When I go to the home page
    Then I should see "Foobar"
    When I follow "Foobar"
    Then I should see "Lorem Ipsum"
    And I should see "Michael Jordan"