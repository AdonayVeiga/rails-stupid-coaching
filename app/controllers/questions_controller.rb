class QuestionsController < ApplicationController
  def ask; end

  def answer
    @question = params[:question]
    @answer = coach_answer_enhanced(@question)
  end

  private

  def coach_answer(your_message)
    if your_message.upcase == 'I am going to work right now!'.upcase
      ''
    elsif your_message.end_with?('?')
      'Silly question, get dressed and go to work!'
    else
      'I don\'t care, get dressed and go to work!'
    end
  end

  def coach_answer_enhanced(your_message)
    if your_message == your_message.upcase && your_message.upcase != 'I am going to work right now!'.upcase
      "I can feel your motivation! #{coach_answer(your_message)}"
    else
      coach_answer(your_message)
    end
  end
end
