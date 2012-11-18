Feature: view notes list
  As a forgetful person
  I want to be able to see things I learned in the past
  So that I can refresh my knowledge

  Background:
    Given I am signed in

  Scenario: view notes list
    Given I have notes
    When I view my notes
    Then I should see a list of notes with their content

  Scenario: view only my notes
    Given I have notes
    And Ivan has notes
    When I view my notes
    Then I should only see mine
