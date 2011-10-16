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

#describe QuestionPaper do
#  subject {QuestionPaper.new}
#
#  it "should add the question to the question paper" do
#    question = mock('Question')
#
#    subject.questions
#    subject.add(question)
#    subject.questions.should include(question)
#  end
#end
#
#describe QuestionPaper do
#  subject {QuestionPaper.new}
#
#  it "should compute the total available marks" do
#
#    first_question = mock('Question')
#    first_question.stub!(:mark).and_return(10)
#    subject.add(first_question)
#
#    second_question  = mock('Question')
#    second_question.stub!(:mark).and_return(20)
#    subject.add(second_question)
#
#    subject.total_marks.should == 30
#
#  end
#end


describe QuestionPaper do
  subject {QuestionPaper.new}

  it "should call the total_marks on the question  in the paper" do

    question = mock('Question')
    question.stub!(:mark).and_return(10)
    subject.add(question)
    #question.should_receive(:some_funny_method_name)

    question2 = mock('Question')
    question2.stub!(:mark).and_return(10)
    subject.add(question2)
    #question2.should_receive(:some_funny_method_name)

    subject.total_marks.should == 20

  end
end