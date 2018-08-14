
def draw_letters
  letters_concatenated = []
  hand = []

  initial_array = [["A", 9], ["B", 2], ["C", 2], ["D", 4], ["E", 12], ["F", 2], ["G", 3], ["H", 2], ["I", 9], ["J", 1], ["K", 1], ["L", 4], ["M", 2], ["N", 6], ["O", 8], ["P", 2], ["Q", 1], ["R", 6], ["S", 4], ["T", 6], ["U", 4], ["V", 2], ["W", 2], ["X", 1], ["Y", 2], ["Z", 1]]

  letter_pool = initial_array.map do |x|
    letters_concatenated.concat([x[0]] * x[1])
  end

  hand = letters_concatenated.sample(10)

  return hand

end


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
