require "http"
require "pastel"
require "tty-font"

system "clear"
pastel = Pastel.new
font = TTY::Font.new(:starwars)

while true
  puts pastel.red(font.write("Cocktail!"))
  puts pastel.red("Welcome! We can pick the cocktails for you by the letter of your pick!")
  puts pastel.red("Please enter a letter: ")
  letter = gets.chomp
  response = HTTP.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?f=#{letter}")

  cocktail = response.parse(:json)["strDrink"]
  puts "Your cocktail is the #{cocktail}! "

  puts "Enter q to quit, any other key to continue."
  input_option = gets.chomp
  if input_option == "q"
    puts "thank you, goodbye."
    break
  end
end
