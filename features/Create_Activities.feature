Feature: POST - Create Activities

  Scenario: POST - Create new activities
    When I send "POST" request to "/api/v1/Activities"
    Then the response status code should be 200
    And the response should contain title for 'created' activity

  Scenario Outline: POST - Create activities of Invalid ID
    When I send POST request with "<type>" payload to "/api/v1/Activities" 
    Then the response status code should be 400
    And response should contain error message validation is errors
  
  Examples:
    | type           |
    | invalid id     |
    | invalid date   |
    | invalid status |