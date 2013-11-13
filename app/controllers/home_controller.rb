class HomeController < ApplicationController
  def index
    @users = User.all
    @event = Event.first
  end
end
