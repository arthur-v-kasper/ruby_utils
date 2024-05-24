require 'json'
require 'net/http'

count = 0

while (count < 10) do
  endpoint = URI.parse('http://api.coindesk.com/v1/bpi/currentprice.json')
  response_body = Net::HTTP.get_response(endpoint).body

  data = JSON.parse(response_body)

  puts "UTC Time: #{data['time']['updatedISO']}"
  puts "USD BTC Value: #{data['bpi']['USD']['rate']}"
  puts '-' * 25

  sleep(3)
  count += 1
end