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