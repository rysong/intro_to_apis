
require "unirest" #unirest is a gem that allows ruby to easily access apis from the web 
system "clear" #clears the terminal 
power = true 

puts "Welcome to the best dictionary ever!"

while power == true do 
  
  puts "Enter a word and I'll tell you the definition (or enter q to quit the app)."
  input = gets.chomp 

  if input == "q"
    puts " "
    puts "buhbye!"
    power = false 

  else 
    api_response = Unirest.get("http://api.wordnik.com/v4/word.json/#{input}/definitions?limit=200&includeRelated=true&useCanonical=false&includeTags=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")
    

    if api_response.body == [] 
      puts " "
      puts "Sorry, that word doesn't exist :( "
      puts " "

    else 
      definition = api_response.body[0]["text"]
      puts " "
      puts "The definition of #{input} is: #{definition.downcase}"
      puts " " 
    end   
  end 
end 



