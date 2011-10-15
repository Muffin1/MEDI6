require 'rspec'
require '../lib/question_paper.rb'

describe QuestionPaper do
  subject {QuestionPaper.new}

  it "should have an empty array" do
    subject.questions.should be_an_instance_of(Array)
   # subject.questions.size.should==0;
  end
end