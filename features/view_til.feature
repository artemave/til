Feature: view note
  In order to read what I posted earlier
  As an author
  I want to be able to see the whole content of a note

  Background:
    Given I am signed in

  @now
  Scenario: show last modified note by default
    Given I have learned the following things in the past:
      | til                                                                                |
      | iced coffee script seems to be an answer to async hell                             |
      | what a day                                                                         |
      | git-svn branches should not be rebased, since they may lose track of remote branch |
    And the first one has been updated last
    When I view my tils
    Then I should see the content of the first one
