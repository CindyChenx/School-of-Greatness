class AppointmentsController < ApplicationController

    def index    
        @appointments = Appointment.all
    end

    def new   
        @appointment = Appointment.new
        @goals = current_user.goals
        @coaches = Coach.all
        # 2.times {@appointment.dates.build}
    end

    def show 
        @appointment = Appointment.find(params[:id])
        @user = User.find(params[:id])
    end

    def create  
        @appointment = Appointment.new(appointment_params)
        if @appointment.save
            flash[:success] = "Your appointment was successfully created!"
            redirect_to appointments_path
        else
            flash[:danger] = "Something went wrong saving your appointment!"
            render :new
        end
    end

    private 

    def appointment_params
        params.require(:appointment).permit(:date, :goal_id, :coach_id)
    end
end


