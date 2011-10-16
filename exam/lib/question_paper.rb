class QuestionPaper
  # To change this template use File | Settings | File Templates.
  attr_accessor :questions, :mark;
    def initialize

        @questions = []
  end

  def questions

        @questions
  end

  def add question
        @questions.push question

  end

  def total_marks
     @mark = 0;
    @questions.each do |element|
      @mark  = @mark + element.mark
    end
    @mark
  end
end