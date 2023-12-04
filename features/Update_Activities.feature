Feature: PUT - Update Activities

  Scenario: PUT - Update activities of Valid ID
    When I send "PUT" request to "/api/v1/Activities/1"
    Then the response status code should be 200
    And the response should contain title for 'updated' activity

  Scenario: PUT - Update activities of Invalid ID
    When I send "PUT" request to "/api/v1/Activities/xxx"
    Then the response status code should be 400
    And response should contain error message the id is "invalid"