class AttendancesController < ApplicationController
  def create
  	@attendance = Attendance.new(attendance_params)
  	@attendance.user_id = current_user.id
  	if @attendance.save
  		flash[:success] = "Event attended"
  	else
  		flash[:danger] = "Unable to attend event"
  	end
  	redirect_to event_url(id: attendance_params[:event_id])
  end

  def destroy
  end

  private
  	def attendance_params
  		params.permit(:event_id)
  	end
end
