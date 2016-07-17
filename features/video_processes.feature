Feature: Video processes

  @javascript
  Scenario: User auth
    Given I am a new, authenticated user
    When I go to my videos list
    Then I create video
    Then I see video in list
    Then I can change title of video
    Then I can add tags to video
    Then I can remove tags from video
    Then I can delete video

  Scenario: User not auth
    When I go to root page
    Then I can't see 'My video' link
    Then I can see Login link
    Then I can see uploaded videos