class InstructorController < ApplicationController
    def index
    instructors = Instructor.all
        render json: instructors
    end

    def create
        instructor = Instructor.create(instructor_params)
        render json: instructor, status: :created
    end


    def update
    instructor = find_params
        if instructor
            instructor.update(instructor_params)
            render json: instructor
        else
            error_msg
        end
    end

    def destroy
    instructor = find_params
        if instructor
        instructor.destroy
            head :no_content
        else
            error_msg
        end
    end

    private 
    def instructor_params
        params.permit(:name)
    end

    def error_msg
        render json: {error: "Instructor not found"}, status: :not_found
    end

    def find_params
        Instructor.find_by(id: params[:id])
    end
end
