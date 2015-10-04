class HomeController < ApplicationController
  def index
    unless user_signed_in?
      redirect_to :signin and return
    end

    @event = Event.newest.first
  end
end
