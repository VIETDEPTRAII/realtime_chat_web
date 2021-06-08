class ChatroomController < ApplicationController
  before_action :require_user, only: %i[index]

  def index
    @messages = Message.custom_display
  end
end
