class DoctorsController < ApplicationController
    def index
        @doctors = Doctor.all.page params[:page]
    end

    def show
        @doctor = Doctor.find(params[:id])
    end

    def new
        @doctor = Doctor.new
    end

    def create
        @doctor = Doctor.create(doctor_params)
        if @doctor.save
            redirect_to @doctor
            # flash[:message] = "Doctor Create successfully!"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @doctor = Doctor.find(params[:id])
    end

    def update
        @doctor = Doctor.find(params[:id])
       if  @doctor.update(doctor_params)
        redirect_to @doctor
       else
        render :edit, status: :unprocessabel_entity
       end
        
    end
    def destroy
        @doctor = Doctor.find(params[:id])
        @doctor.destroy
        redirect_to @doctor
    end

    private
    def doctor_params
        params.require(:doctor).permit(:name, :specialties, :phone)
    end
end
