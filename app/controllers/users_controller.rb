class UsersController < ApplicationController
  def update
    # update user

    @user = User.find(params[:id])
    authorize @user
    @user.motto = params[:user][:motto]
    @user.description = params[:user][:description]
    @user.address = params[:user][:address]
    @user.photo = params[:user][:photo]

    # create answers

    if @user.save

      @answer_1 = Answer.new(user_id: @user.id, question_id: 1)

      if params["question-1"] == "2"
        @answer_1.answer = false
      else
        @answer_1.answer = true
      end

      @answer_1.save

      @answer_2 = Answer.new(user_id: @user.id, question_id: 1)

      if params["question-2"] == "2"
        @answer_2.answer = false
      else
        @answer_2.answer = true
      end

      @answer_2.save

      @answer_3 = Answer.new(user_id: @user.id, question_id: 1)

      if params["question-3"] == "2"
        @answer_3.answer = false
      else
        @answer_3.answer = true
      end

      @answer_3.save

    redirect_to profile_path

    end
  end
end
