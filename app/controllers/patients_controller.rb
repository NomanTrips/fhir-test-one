class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

#     response.headers["Content-Type"] = 'application/json+fhir'
 
#def header_json
 # response.headers['Content-type'] = 'application/json+fhir'
#end

  def show_patient_record
	#@testpatient = Patient.where("patients.content->>'name' = :our_patient", our_patient:"Timothy Cavendish")
	#@testpatient = Patient.where("patients.content->>'finished' = :true", true: "true") 
	
	#@testpatient = Patient.where("patients.content->'patient'->>'name' = 'Timothy Cavendish'") This one works
	#@testpatient = Patient.where("patients.content->'patient'->>'identifier' = '#{params[id]}'")
	@patient_array = @testpatient.to_a()
	
	puts @patient_array.size
	@patient_array.each do |patient|
		puts patient.content
	end
	
	#puts @testpatient.empty?()
  end
  
  def retreive_patient_record
	puts 'juju'
	puts params
	puts 'juju fishy'
	@the_patient_id = params[:id]
  	@testpatient = Patient.where("patients.content->'patient'->>'identifier' = '#{@the_patient_id}'")
	@patient_array = @testpatient.to_a()
	
	#puts @patient_array.size
	@patient_array.each do |patient|
		@patient_record = patient
		#puts patient.content
	end
	
	#puts 'this is a test...'
	#puts @patient_record.content
	return @patient_record
	
  end
  
  
  # GET /patients
  # GET /patients.json
  def index
  	#show_patient_record
    @patients = Patient.all

	#@cavendish = show_patient_record()
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
	render json: @patient.content, content_type: "application/json+fhir"
	#@test_patient_as_json = @patient.content
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

      # Never trust parameters from the scary internet, only allow the white list through.
   def patient_params
      params.require(:patient).permit(:id)
	  #params[:patient]
    end
	
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = retreive_patient_record
	  #@patient = Patient.find(params[:id])
    end


end
