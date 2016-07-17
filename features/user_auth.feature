Feature: Video processes

  @javascript
  Scenario: Login ability
    Given I am a new, authenticated user
    When I go to my videos list
    When I create video
    Then I see video in list
    Then I can change title of video
    Then I can add tags to video
    Then I can remove tags from video
    Then I can delete video
    Then i can cancel upload of video