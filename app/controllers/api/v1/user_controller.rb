class Api::V1::UserController < ApplicationController
  def index
    @users = User.all
    render json: {
      status: 200,
      data: @users
    }
  end

  def show
    @user = User.find(params[:id])

    render json: {
      status: 200,
      data: @user
    }
  end

  def create
    if User.exists?(cpf: validator[:cpf])
      return render json: {
        status: 406,
        error: 'CPF already registered!'
      }
    end

    @user = User.new(validator)

    @user.valid? && @user.save

    render json: {
      status: 200,
      data: @user
    }
  end

  def update
    @user = User.find(params[:id])

    if @user.update(validator)
      render json: {
        status: 200,
        data: validator
      }
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      render json: {
        status: 200,
        data: {}
      }
    end
  end

  private

  def validator
    params.permit(
      :email,
      :name,
      :cpf,
    )
  end
end
