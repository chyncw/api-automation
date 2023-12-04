Feature: GET - Retrieve Activities by Spesific ID

  Scenario: GET - Retrieve Activities by Valid ID
    When I send a "GET" request to "/api/v1/Activities/1"
    Then the response status code should be 200
    And the response should contain title for "spesific" activity

  Scenario: GET - Retrieve Activities by Invalid ID
    When I send a "GET" request to "/api/v1/Activities/xxx"
    Then the response status code should be 400
    And response should contain error message the id is "invalid"
  
  Scenario: GET - Retrieve Activities when ID Not Found
    When I send a "GET" request to "/api/v1/Activities/0"
    Then the response status code should be 404
    And response should contain error message the id is "not found"