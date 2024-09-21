# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  let(:user) { create(:user) }
  let(:student) { create(:student, user: user) }

  before do
    sign_in user # Make sure to include Devise test helpers
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns @students' do
      get :index
      expect(controller.instance_variable_get(:@students)).to eq([student])
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: student.id }
      expect(response).to be_successful
    end

    it 'assigns the requested student to @student' do
      get :show, params: { id: student.id }
      expect(controller.instance_variable_get(:@student)).to eq(student)
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end

    it 'assigns a new student to @student' do
      get :new
      expect(controller.instance_variable_get(:@student)).to be_a_new(Student)
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get :edit, params: { id: student.id }
      expect(response).to be_successful
    end

    it 'assigns the requested student to @student' do
      get :edit, params: { id: student.id }
      expect(controller.instance_variable_get(:@student)).to eq(student)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_attributes) { { student: { name: 'Jane Doe', subject: 'Science', mark: 90 } } }

      it 'creates a new Student' do
        expect do
          post :create, params: valid_attributes
        end.to change(Student, :count).by(1)
      end

      it 'redirects to the students list' do
        post :create, params: valid_attributes
        expect(response).to redirect_to(students_path)
      end
    end

    context 'with existing student' do
      let(:existing_attributes) { { student: { name: student.name, subject: student.subject, mark: 95 } } }

      it 'updates the existing student mark' do
        post :create, params: existing_attributes
        student.reload
        expect(student.mark).to eq(95)
      end

      it 'redirects to the students list' do
        post :create, params: existing_attributes
        expect(response).to redirect_to(students_path)
      end
    end

    context 'with invalid params' do
      let(:invalid_attributes) { { student: { name: '', subject: '', mark: nil } } }

      it 'does not create a new Student' do
        expect do
          post :create, params: invalid_attributes
        end.not_to change(Student, :count)
      end

      it 'renders the new template' do
        post :create, params: invalid_attributes
        expect(response).to render_template(:new)
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested student' do
      student # Ensure the student is created
      expect do
        delete :destroy, params: { id: student.id }
      end.to change(Student, :count).by(-1)
    end

    it 'redirects to the students list' do
      delete :destroy, params: { id: student.id }
      expect(response).to redirect_to(students_path)
    end
  end
end
