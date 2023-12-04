Feature: GET - Retrieve all activities

  Scenario: GET - Retrieve all activities
    When I send a "GET" request to "/api/v1/Activities"
    Then the response status code should be 200
    And the response should contain title for "all" activity