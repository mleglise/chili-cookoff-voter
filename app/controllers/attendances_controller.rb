class AttendancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  # GET /attendances
  # GET /attendances.json
  def index
    @attendances = Attendance.all
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
    # Event admin can see this page. All others get redirected to the event.
    unless can? :edit, @event
      redirect_to @event and return
    end
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
  end

  # GET /attendances/1/edit
  def edit
  end

  # POST /attendances
  # POST /attendances.json
  def create
    @attendance = Attendance.find_or_initialize_by(
      event_id: params[:event_id],
      user_id: current_user.id)
    @attendance.guest_type = params[:attendance][:guest_type]

    respond_to do |format|
      if @attendance.save
        if @attendance.chef?
          format.html { redirect_to new_event_entry_path(@event), notice: 'What did you bring?' }
        else
          format.html { redirect_to @event, notice: 'Start Eating!' }
        end
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { redirect_to @event }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendances/1
  # PATCH/PUT /attendances/1.json
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to @attendance, notice: 'Attendance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to attendances_url }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:event_id, :guest_type, :approved_at)
    end
end
