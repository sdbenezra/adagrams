# require 'pry'
require 'csv'

# Draws 10 random letters from alphabetic array
def draw_letters
  letters_concatenated = []
  hand = []

  initial_array = [["A", 9], ["B", 2], ["C", 2], ["D", 4], ["E", 12], ["F", 2], ["G", 3], ["H", 2], ["I", 9], ["J", 1], ["K", 1], ["L", 4], ["M", 2], ["N", 6], ["O", 8], ["P", 2], ["Q", 1], ["R", 6], ["S", 4], ["T", 6], ["U", 4], ["V", 2], ["W", 2], ["X", 1], ["Y", 2], ["Z", 1]]

  initial_array.each do |x|
    letters_concatenated.concat([x[0]] * x[1])
  end

  hand = letters_concatenated.sample(10)

  return hand

end

# Determines if user word uses letters in hand
def uses_available_letters?(input, letters_in_hand)
  word = input.chars
  word.each do |letter|
    if letters_in_hand.include?(letter)
      letters_in_hand.delete_at(letters_in_hand.index(letter))
    else
      return false
    end
  end
  return true
end

# Calculates score for user word
def score_word(word)
  score = 0
  score_word = word.upcase.chars
  score_word.each do |letter|
    if %w[A E I O U L N R S T].include?(letter)
      score += 1
    elsif %w[D G].include?(letter)
      score += 2
    elsif %w[B C M P].include?(letter)
      score += 3
    elsif %w[F H V W Y].include?(letter)
      score += 4
    elsif %w[K].include?(letter)
      score += 5
    elsif %w[J X].include?(letter)
      score += 8
    elsif %w[Q Z].include?(letter)
      score += 10
    end
  end

  if score_word.length >= 7 && score_word.length <= 10
    score += 8
  end
  return score
end

# Determines highest scoring word and returns both word and score
def highest_score_from(words)
  array = []
  max_score = 0
  winning_word = ""
  max_values = []
  min_length = 10
  hash = {}

  words.each do |word|
    score = score_word(word)
    array << {word: word, score: score}
  end

  array.each do |hash|
    if hash[:score] == max_score
      winning_word = hash[:word]
      max_values << {word: winning_word, score: max_score}
    elsif hash[:score] > max_score
      max_values = []
      max_score = hash[:score]
      winning_word = hash[:word]
      max_values << {word: winning_word, score: max_score}
    end
  end

  max_values.each do |array|
    if array[:word].length == 10
      hash = {word: array[:word], score: array[:score].to_i}
      return hash
    end
    if array[:word].length < min_length
      min_length = array[:word].length
      winning_word = array[:word]
      max_score = array[:score]
      hash = {word: winning_word, score: max_score}
    end
  end
  return hash
end

# Determines whether users word is a valid English word
def is_in_english_dict?(input)
  check = false
  dictionary = CSV.open('assets/dictionary-english.csv')
  word = input.downcase
  dictionary.each do |row|
    if row.include?(word)
      check = true
    end
  end
  return check
end
