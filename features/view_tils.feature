Feature: view tils
  As a forgetful person
  I want to be able to see things I learned in the past
  So that I can refresh my knowledge

  Background:
    Given I am signed in

  Scenario: view tils
    Given I have learned the following things in the past:
      | til                                                                                |
      | iced coffee script seems to be an answer to async hell                             |
      | git-svn branches should not be rebased, since they may lose track of remote branch |
    When I view my tils
    Then my list of tils should include the following:
      | til                                                                                |
      | iced coffee script seems to be an answer to async hell                             |
      | git-svn branches should not be rebased, since they may lose track of remote branch |
