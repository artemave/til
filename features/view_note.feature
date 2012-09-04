Feature: view note
  In order to read what I posted earlier
  As an author
  I want to be able to see the whole content of a note

  Background:
    Given I am signed in

  Scenario: view last modified note by default
    Given I have some notes
    And the oldest one has been updated most recently
    When I view my notes
    Then I should see the content of the oldest note

  Scenario: view particular note
    Given I have some notes
    When I choose to see one
    Then I should see its content
