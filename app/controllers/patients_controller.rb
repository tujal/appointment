class PatientsController < ApplicationController
    def index
        @patients = Patient.all.page params[:page]
    end
    
    def show
        @patient = Patient.find(params[:id])
    end

    def new
        @patient = Patient.new
        @patient.appointments.build
    end

    def create
        @patient = Patient.create(patients_path)
        if @patient.save
            flash[:message] = "Patient Create successfully!"
            redirect_to @patient
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @patient = Patient.find(params[:id])
    end
    def update
        @patient = Patient.find(params[:id])
        if @patient.update(patients_path)
            redirect_to @patient
        else
            render :edit, status: :unprocessabel_entity
        end
    end

    def destroy
        @patient = Patient.find(params[:id])
        @patient.destroy
        redirect_to @patient
     end

    private
    def patients_path
        params.require(:patient).permit(:name, :age, :gender,appointments_attributes:[:appointment_date, :doctor_id, :patient_id])
    end
end
