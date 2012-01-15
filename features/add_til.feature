Feature: add TIL
  In order to keep track of what I learn
  As a constant learner
  I want to be able to create TIL record

  Background:
    Given I am signed in

  Scenario: Create TIL
    Given I view my TILs
    When I create new TIL with title "mockito delay()" and content "that mockito has got awesome handling of async verification with delay()"
    Then list of my TILs should have "mockito delay()" with content "that mockito has got awesome handling of async verification with delay()"
