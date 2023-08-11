# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @user_tools = ToolFacade.users_tools(@user.id)
    @borrowed_tools = ToolFacade.borrowed_tools(@user.id)
  end
end
