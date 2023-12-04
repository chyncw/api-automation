When('I send a {string} request to {string}') do |method, url|
    @response = HTTParty.send(method.downcase, "https://fakerestapi.azurewebsites.net#{url}")
end

Then('the response status code should be {int}') do |status_code|
  expect(@response.code).to eq(status_code)
end

Then('the response should contain title for {string} activity') do |type|
  response_body = JSON.parse(@response.body)
  
  if type == 'all'
    all = response_body[0]['title']
    expect(all).to include('Activity')
  elsif type == 'spesific'
    spesific = response_body['title']
    expect(spesific).to include('Activity 1')
  else
    spesific = response_body['title']
    expect(spesific).to include('title')
  end
end

Then('response should contain error message the id is {string}') do |type|
  response_body = JSON.parse(@response.body)
  
  if type == 'invalid'
    error_invalid_id = response_body['errors']['id'][0]
    expect(error_invalid_id).to include('is not valid')
  else
    error_not_found = response_body['title']
    expect(error_not_found).to include('Not Found')
  end
end

When('I send {string} request to {string}') do |method, url|
  @payload = {
    id: 1,
    title: 'title',
    dueDate: '2023-12-04',
    completed: true
  }

  @response = HTTParty.send(method.downcase, "https://fakerestapi.azurewebsites.net#{url}", body: @payload.to_json, headers: { 'Content-Type' => 'application/json' })
end

When('I send POST request with {string} payload to {string}') do |type, url|
 case type
 when 'invalid id'
  @payload = {
    id: nil,
    title: 'title',
    dueDate: '2023-12-04',
    completed: true
  }
 when 'invalid date'
  @payload = {
    id: 1,
    title: 'title',
    dueDate: '12/1/2001',
    completed: true
  }
when 'invalid status'
  @payload = {
    id: 1,
    title: 'title',
    dueDate: '2023-12-04',
    completed: nil
  }
  end

  @response = HTTParty.post("https://fakerestapi.azurewebsites.net#{url}", body: @payload.to_json, headers: { 'Content-Type' => 'application/json' })
end

Then('response should contain error message validation is errors') do
  response_body = JSON.parse(@response.body)
  error_not_found = response_body['title']
  expect(error_not_found).to include('One or more validation errors occurred.')
end