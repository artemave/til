Feature: edit note
  As a user
  I want to be able to edit note I posted earlier
  So that I can fix errors

  Background:
    Given I am signed in

  Scenario: edit note
    Given I have a note with content "bloody roots"
    When I change its content to "wat"
    Then its content should be "wat"
