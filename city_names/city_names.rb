#
# Create a dictionary with 10 city names where the city name would be a string
# and the key, and the area code is the value
# Get input from the user on city name
# Display the city name to the user which are available in the dictionary
# Display area code based on users city choice
# USE:
# Loop - Keep the program running and promp the user for new city names to lookup
# Method - look up area code with hash input and output area code
# Method - Display City Names
# Method - Menu
#

####################################################################
#
#     SUB: get_cities
#     REQUIRES: dial_book
#     Returns: city names
#
####################################################################
def get_cities(dial_book)
  dial_book.each { |k, _v| puts k }
end

####################################################################
#
#     SUB: get_areacode
#     REQUIRES: dial_book
#     Returns: area code
#
####################################################################
def get_areacode(dial_book, prompt)
  dial_book[prompt]
end

####################################################################
#
#     MAIN Program
#
####################################################################
# Initialize Globals
dial_book = {
    'newyork' => '212',
    'newbrunswick' => '732'
}

# Start Menu Loop
loop do
  # Make Menu
  puts '========== City Lookup =========='
  puts 'For City Name Display, press 1.
To look up an Area Code, press 2.
To exit the program, press 0.'
  puts '========== City Lookup =========='

  # Get Menu Choice
  menu_choice = gets.chomp

  # Processing is in the cases so that methods are simple replies (very API ready)
  case menu_choice
  when '0'
    puts 'Exiting...'
    break
  when '1'
    get_cities(dial_book)
  when '2'
    puts "Which city would you like to look up?"
    get_cities(dial_book)
    answer = gets.chomp
    if dial_book.include?(answer)
      puts "The area code for #{answer} is #{get_areacode(dial_book, answer)}"
    else
      puts 'Please enter a valid city name.'
    end
  else
    puts 'Please enter a valid choice'
  end # EndCase
end # EndLoop
