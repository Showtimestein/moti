require("bundler")
Bundler.require()
require 'uri'
require 'net/http'
require 'openssl'

url = URI("https://motivational-quotes1.p.rapidapi.com/motivation")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Post.new(url)
request["content-type"] = 'application/json'
request["x-rapidapi-key"] = 'e8cf90aaf2msh9c51572e6b94e2bp135c3fjsn4347bc06ae89'
request["x-rapidapi-host"] = 'motivational-quotes1.p.rapidapi.com'
request.body = "{\r\n    \"key1\": \"value\",\r\n    \"key2\": \"value\"\r\n}"

response = http.request(request)

account_sid = "AC0e85fec66674190ffa7b1bc49305e756"
auth_token = "60b7d2016f04925964710fd2ab3337a7"

@client = Twilio::REST::Client.new(account_sid, auth_token)

to =  "+14692478055"
from = "+12058584077"

@reminder_user_name = current_user.name
@client.messages.create(
    to: to,
    from: from,
    body: "Hey," + @reminder_user_name + "!" + " " + "Just wanted to remind you about:" + "\n" + " " + "\n" + "•" + goal + "\n" + " " + "\n" + response.read_body
)
