Feature: Merge Articles
  As a blog administrator
  In order to avoid multiple articles being on the same topic
  I want to be able to merge them into one article

  Background:
    Given the blog is set up

  Scenario: A non-admin cannot merge articles
    Given I am logged in as "regularuser"
    And I am editing an existing article
    Then I should not see "Merge Articles"

  Scenario: Admin can merge articles
    Given I am logged in as "admin"
    And I am editing an existing article
    Then I should see "Merge Articles"

  Scenario: A merged article contains the text of source articles and have one title
    Given I am logged in as "admin"
    And I've published an article "Foo" with body "Lorem Ipsum"
    And I've published an article "Bar" with body "Michael Jordan"
    When I merge article "Bar" with article "Foo"
    Then I should be on the admin content page
    And I should see "Merge successfully"
    And I should see "Bar"
    And I should not see "Foo"
    When I am reading article "Bar"
    Then I should see "Lorem Ipsum"
    And I should see "Michael Jordan"

  Scenario: A merged article have one author
    Given I am logged in as "regularuser"
    And I've published an article "Foo" with body "Lorem Ipsum"
    Then I am logged in as "admin"
    And I've published an article "Bar" with body "Michael Jordan"
    When I merge article "Bar" with article "Foo"
    And I should see "admin"
    # And I should not see "regularuser"
    # the page has "regularuser" in a drop down, need a more precise step here

  Scenario: A merged article have the comments of source articles
    Given I am logged in as "admin"
    And I've published an article "Foo" with body "Lorem Ipsum"
    And I've posted a comment "Nice" on article "Foo"
    And I've published an article "Bar" with body "Michael Jordan"
    And I've posted a comment "Bad" on article "Bar"
    When I merge article "Bar" with article "Foo"
    When I am reading article "Bar"
    Then I should see "Nice"
    And I should see "Bad"