Feature: add note
  In order to keep my tips and tricks at hand
  As someone who forgets things quickly
  I want to be able to store them as notes

  Background:
    Given I am signed in

  Scenario: Create note
    Given I've just googled something useful
    When I save it in new note
    Then it should appear in the list of my notes
