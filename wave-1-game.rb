require_relative 'lib/adagrams'

def display_welcome_message
  puts "Welcome to Adagrams!"
  puts "Let's draw 10 letters from the letter pool..."
end

def display_drawn_letters(letters)
  puts "You have drawn the letters:"
  puts letters.join(', ')
end

def run_game
  display_welcome_message
  display_drawn_letters(draw_letters)
end

def draw_letters
  letter_pool = []
  letters_concatenated = []
  hand = []

  initial_array = [["A", 9], ["B", 2], ["C", 2], ["D", 4], ["E", 12], ["F", 2], ["G", 3], ["H", 2], ["I", 9], ["J", 1], ["K", 1], ["L", 4], ["M", 2], ["N", 6], ["O", 8], ["P", 2], ["Q", 1], ["R", 6], ["S", 4], ["T", 6], ["U", 4], ["V", 2], ["W", 2], ["X", 1], ["Y", 2], ["Z", 1]]

  letter_pool = initial_array.map do |x|
    [x[0]] * x[1]
  end

  letter_pool.each do |x|
    letters_concatenated.concat(x)
  end

  10.times do |x|
    hand << letters_concatenated.sample
  end

  return hand

end

run_game
