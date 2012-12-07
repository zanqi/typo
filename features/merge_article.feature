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

  Scenario: A merged article contains the text of source articles and have one title
    Given I am logged in as "admin"
    And I've published an article "Foobar" with body "Lorem Ipsum"
    And I've published an article "Foobar2" with body "Michael Jordan"
    When I follow "Foobar"
    And I fill in "Article ID" with "3"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "Foobar"
    And I should not see "Foobar2"
    When I am looking at article "Foobar"
    Then I should see "Lorem Ipsum"
    And I should see "Michael Jordan"

  Scenario: A merged article have one author
    Given I am logged in as "user"
    And I've published an article "Foobar" with body "Lorem Ipsum"
    Then I am logged in as "admin"
    And I've published an article "Foobar2" with body "Michael Jordan"
    When I follow "Foobar"
    And I fill in "Article ID" with "3"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "user"
    And I should not see "admin"

  Scenario: A merged article have the comments of source articles
    Given I am logged in as "admin"
    And I've published an article "Foobar" with body "Lorem Ipsum"
    And I've posted a comment "Nice" on article "Foobar"
    And I've published an article "Foobar2" with body "Michael Jordan"
    And I've posted a comment "Bad" on article "Foobar2"
    When I edit article "Foobar"
    And I fill in "Article ID" with "3"
    And I press "Merge"
    When I am looking at article "Foobar"
    Then I should see "Nice"
    And I should see "Bad"