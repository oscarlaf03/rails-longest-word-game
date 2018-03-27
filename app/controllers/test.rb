require 'open-uri'
require 'json'


def random_letters
  alphabet = %w[a b c d e f g h i j k l m n o p q r s t u v w y z]
  array = []
  until array.length > 10
    array << alphabet.sample
  end
  return array
end

@letters = random_letters
puts @letters

word = "teste"

def valid_word?
    response = open("https://wagon-dictionary.herokuapp.com/#{@attempt.strip.downcase}").read
    JSON.parse(response)["found"]
  end

  def valid_letters?
    counter = 0
    @attempt.chars.each do |letter|
      counter += 1 if @attempt.chars.count(letter) <= @letters.count(letter)
    end
    return @attempt.chars.length == counter
  end

  def total_score
    score = 0
    if valid_word? && valid_letters?
      score = @attempt.length * 50
      message = "Well done"
    elsif valid_word? && !valid_letters?
      score = 0
      message = "You word has invalid letters"
    elsif !valid_word? && valid_letters?
      score  = 0
      message = "That is not a real English word"
    else
      score = 0
      message = "Are you kidding me!!??"
    end
    return "#{message}\nYour score is:#{score}"
  end
