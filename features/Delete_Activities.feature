Feature: DELETE - Delete Activities

  Scenario: DELETE - Delete valid activities
    When I send a "DELETE" request to "/api/v1/Activities/1"
    Then the response status code should be 200

  Scenario: DELETE - Delete invalid activities
    When I send a "DELETE" request to "/api/v1/Activities/xxx"
    Then the response status code should be 400
    And response should contain error message the id is "invalid"