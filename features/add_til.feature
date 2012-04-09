Feature: add TIL
  In order to keep track of what I learn
  As a constant learner
  I want to be able to create TIL record

  Background:
    Given I am signed in

  Scenario: Create TIL
    Given today I learned that "mockito has got awesome handling of async verifications with delay()"
    When I add new TIL
    Then list of my TILs should include "mockito has got awesome handling of async verifications with delay()"

