class StudentController < ApplicationController
    def index
        students = Student.all
        render json: students
    end

    def create
        student = Student.create(student_params)
        render json: student, status: :created
    end


    def update
        student = find_params
        if student
            student.update(student_params)
            render json: student
        else
            error_msg
        end
    end

    def destroy
        student = find_params
        if student
            student.destroy
            head :no_content
        else
            error_msg
        end
    end

    private 
    def student_params
        params.permit(:name, :major, :age)
    end

    def error_msg
        render json: {error: "student not found"}, status: :not_found
    end

    def find_params
        Spice.find_by(id: params[:id])
    end
end
