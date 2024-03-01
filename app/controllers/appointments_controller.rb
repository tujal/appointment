class AppointmentsController < ApplicationController
    # def new
    #     @appointment = Appointment.new
    #     @doctor = Doctor.all
    # end
    # def create
    #     # @patient = Patient.find(params[:id])
    #     @appointment = Appointments.create(appointments_params)
    #     if @appointment.save
    #         redirect_to root_path
    #     else
    #         render :new, status: :unprocessabel_entity
    #     end
    # end

    def destroy
    
        @patient = Patient.find(params[:patient_id])
        @appointment = @patient.appointments.find(params[:id])
        @appointment.destroy
        redirect_to @patient
    end

    # private
    # def appointments_params
    #     params.require(:appointment).permit(:appointment_date, :doctor_id, :patient_id)
    # end
end
