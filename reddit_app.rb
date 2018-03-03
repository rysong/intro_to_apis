require "unirest"
system "clear"

print "Enter a name for a subreddit: "
input = gets.chomp

response = Unirest.get("https://www.reddit.com/r/#{input}/.json")

if response.body["data"]["children"] == []
  puts "Sorry, that subreddit doesn't exist."
else 
  index = 0
  puts "POSTS"

  response.body["data"]["children"].length.times do
    post = response.body["data"]["children"][index]["data"]["title"]
    puts "#{index + 1}. #{post}"
    index = index + 1
  end
end

# puts "Enter the number of the post you want to see the comments."

# post_number = gets.chomp.to_i
# post_link = response.body["data"]["children"][post_number - 1]["data"]["permalink"]

# comments = Unirest.get("https://www.reddit.com#{post_link}.json")

# puts comments