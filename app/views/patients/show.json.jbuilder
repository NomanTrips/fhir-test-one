#puts @patient.content.class
puts  @patient.content
#json.extract! @patient.content, :identifier
json.array! @patient.content

#puts json.patient.class
#json.patient do |json|
#    json.(@patient.content, :identifier, :name)
#end

#json.patient do
 #  json.id @patient.content.identifier
  #json.email_address @message.creator.email_address_with_name
  #json.url url_for(@message.creator, format: :json)
#end


#json.array! @patient do |patient|
#  json.extract! patient, :identifier, :name
#end
