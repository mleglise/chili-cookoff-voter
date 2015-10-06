class RatingsController < ApplicationController
  before_action :authenticate_user!

  # POST /ratings
  # POST /ratings.json
  def create
    @rating = Rating.find_or_initialize_by(user: current_user, entry_id: params[:entry_id])
    @rating.score = params[:score]

    respond_to do |format|
      if @rating.save
        # format.html { redirect_to @event, notice: 'Entry was successfully created.' }
        format.json { render text: 'OK', status: :created, location: @rating }
      else
        # format.html { render action: 'new' }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

end
