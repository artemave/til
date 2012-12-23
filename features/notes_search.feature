@wip @javascript
Feature: notes search
  In order to access notes quickly
  As an impatient person
  I need a way to filter out only notes by keyword

  Background:
    Given I am signed in

  Scenario: filter notes by keyword
    Given there exist notes with the following content:
      | ruboto |
      | robots |
      | goruko |
      | css    |
    When I want notes only containing "r"
    Then I should only see the following notes:
      | ruboto |
      | robots |
      | goruko |
    When I want notes only containing "ru"
    Then I should only see the following notes:
      | ruboto |
      | goruko |
    When I want notes only containing "rub"
    Then I should only see the following notes:
      | ruboto |
