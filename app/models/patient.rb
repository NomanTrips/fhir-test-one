class Patient < ActiveRecord::Base

 # scope :patientrecord, -> { 
  #  where("patients.content->>'name' = :our_patient", our_patient: "Timothy Cavendish")
  #}
 
#def self.show_patient_record()
 # @patientrec = where("patients.content->>'name' = :our_patient", our_patient: "Timothy Cavendish")
  #return @patientrec
#end

end



# Usage
#Patient.create(name: { kind: "user_renamed", change: ["jack", "john"]})
 
#event = Event.first
#event.payload # => {"kind"=>"user_renamed", "change"=>["jack", "john"]}
 
## Query based on JSON document
# The -> operator returns the original JSON type (which might be an object), whereas ->> returns text
#Patient.where("payload->>'kind' = ?", "user_renamed")
#where("patients.content->>'name' = :our_patient", our_patient: "Timothy Cavendish") 