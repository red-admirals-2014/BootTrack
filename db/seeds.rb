# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
grads = DBC::User.all


grads.each do |grad|
  Graduate.create(cohort_id: grad.cohort_id, name: grad.name, email: grad.email, linked_in: grad.profile[:linked_in])
end


cohort = DBC::Cohort.all

cohort.each do |cohort|
  Cohort.create(id: cohort.id, location: cohort.location, start_date: cohort.start_date)
end

puts Graduate.all.count
puts Cohort.all.count



client = LinkedIn::Client.new('752jy5l9lpe28m', 'GcvQ6BiPEAST2Q1k')

request_token = client.request_token({}, :scope => "r_basicprofile")

rtoken = request_token.token
rsecret = request_token.secret

pin = 27595
client.authorize_from_request(rtoken, rsecret, pin)
client.authorize_from_access("8d680cb1-b9d0-4d24-9ca6-af042547b435", "91acf96c-4d05-4024-8cac-f99dfa7e31b8")
client.profile(:url => 'www.linkedin.com/pub/tiffany-kaiser/55/650/158/') # => in here we put the fields
                                                                          # we want, as well

# Find all winter melt cohort and delete them. Loop through all linkedin urls in our database
# to hit api.
# need to have one second between api hits (or delayed for hours!!)
  # make sure everything has an http:// in the beginning if it doesnt
  # if it is blank sub with nil
  # rescue errors
      # begin
      # rescue => e
      # p e
      # p "bad url"
      # u.update_attributes(bla: nil, bla: nil)
  # skip anything w/out linked in/nil linkedin











