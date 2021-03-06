class RemindersController < ApplicationController
  include Devise::Controllers::Helpers
  before_action :set_reminder, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, expect: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /reminders or /reminders.json
  def index
    @reminders = Reminder.all
  end

  # GET /reminders/1 or /reminders/1.json
  def show
  end

  # GET /reminders/new
  def new
    #@reminder = Reminder.new
    @reminder = current_user.reminders.build
  end

  # GET /reminders/1/edit
  def edit
  end

  # POST /reminders or /reminders.json
  def create
    #@reminder = Reminder.new(reminder_params)
    @reminder = current_user.reminders.build(reminder_params)
    @reminder_user_phone = current_user.phone
    @reminder_user_name = current_user.name
    respond_to do |format|
      if @reminder.save
        format.html { redirect_to @reminder, notice: "Reminder was successfully created." }
        format.json { render :show, status: :created, location: @reminder }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reminders/1 or /reminders/1.json
  def update
    respond_to do |format|
      if @reminder.update(reminder_params)
        format.html { redirect_to @reminder, notice: "Reminder was successfully updated." }
        format.json { render :show, status: :ok, location: @reminder }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reminders/1 or /reminders/1.json
  def destroy
    @reminder.destroy
    respond_to do |format|
      format.html { redirect_to reminders_url, notice: "Reminder was successfully destroyed." }
      format.json { head :no_content }
    end
  end

def correct_user
  @reminder = current_user.reminders.find_by(id: params[:id])
  redirect_to reminders_path, notice: "Not Authorized To Edit This Reminder" if @reminder.nil?

end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reminder
      @reminder = Reminder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reminder_params
      params.require(:reminder).permit(:goal, :user_id)
    end
end
