Feature: suite events
  In order to run tasks before and after important events
  As a test suite
  I need to provide a way to hook into these events

  Background:
    Given I'm listening to suite events

  Scenario: triggers before scenario event
    Given a feature path "features/load_features.feature:6"
    When I run feature suite
    Then there was event triggered before scenario "load features within path"

  Scenario: triggers appropriate events for a single scenario
    Given a feature path "features/load_features.feature:6"
    When I run feature suite
    Then these events had to be fired for a number of times:
      | BeforeSuite    | 1 |
      | BeforeScenario | 1 |
      | BeforeStep     | 3 |
      | AfterStep      | 3 |
      | AfterScenario  | 1 |
      | AfterSuite     | 1 |

  Scenario: triggers appropriate events whole feature
    Given a feature path "features/load_features.feature"
    When I run feature suite
    Then these events had to be fired for a number of times:
      | BeforeSuite    | 1  |
      | BeforeScenario | 4  |
      | BeforeStep     | 13 |
      | AfterStep      | 13 |
      | AfterScenario  | 4  |
      | AfterSuite     | 1  |