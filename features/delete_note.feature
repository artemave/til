Feature: delete note
  If I saved some crap
  I want to be able to remote it

  Background:
    Given I am signed in

  Scenario: delete note
    Given I have a note
    When I delete it
    Then it should no longer exist
    And it should not be displayed
