class QuestionsController < ApplicationController

  before_action :set_question, only: %i[update show destroy edit]
  def create
    question = Question.create(question_params)

    redirect_to questions_path(question), notice: 'New question create'
  end

  def update
    @question.update(question_params)

    redirect_to question_path(@question), notice: 'Save questions!'
  end

  def destroy
    @question.destroy

    redirect_to question_path, notice: 'Questions delete'
  end

  def show
  end

  def index
    @question = Question.all
    @questions = Question.new
  end

  def new
    @question = Question.new
  end

  def edit

  end

  private

  def question_params
    params.require(:question).permit(:body, :user_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
