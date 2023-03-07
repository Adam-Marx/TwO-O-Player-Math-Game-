class Question
  attr_reader :question, :answer

  def initialize(question, answer)
    @question = question
    @answer = answer
  end

  def prompt
    puts "#{@question}"
    gets.chomp.to_i
  end
end
