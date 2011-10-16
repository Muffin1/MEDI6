require 'rspec'
require '../lib/question_paper.rb'

#describe QuestionPaper do
#  subject {QuestionPaper.new}
#
#  it "should have an empty array" do
#
#    subject.questions.should be_an_instance_of(Array)
#    subject.questions.size.should==0;
#  end
#end

describe QuestionPaper do
  subject {QuestionPaper.new}

  it "should add the question to the question paper" do
    question = mock('Question')

    subject.questions
    subject.add(question)
    subject.questions.should include(question)
  end
end