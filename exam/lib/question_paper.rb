class QuestionPaper
  # To change this template use File | Settings | File Templates.
  attr_accessor :questions
    def initialize

        @questions = []
  end

  def questions

        @questions
  end

  def add question
        @questions.push question

  end
end