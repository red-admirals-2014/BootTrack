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


all_grads = Graduate.all

all_grads.each do |grad|
  url = grad.linked_in
  if url && url != ""
    if !(url =~ /^https?:/i)
      url = "http://" + url
    end
  else
    url = nil
  end

  client = LinkedIn::Client.new('752jy5l9lpe28m', 'GcvQ6BiPEAST2Q1k')
  client.authorize_from_access("8d680cb1-b9d0-4d24-9ca6-af042547b435", "91acf96c-4d05-4024-8cac-f99dfa7e31b8")
  new_info = client.profile(:url => url , :fields => ['headline', 'picture_url', 'location:(name)'] # this is where error would pop up
  grad.update_attributes(employer: new_info.headline, location: new_info.location.name, picture: new_info.picture_url)
end





# client = LinkedIn::Client.new('752jy5l9lpe28m', 'GcvQ6BiPEAST2Q1k') this one
# request_token = client.request_token({}, :scope => "r_basicprofile"
# rtoken = request_token.token
# rsecret = request_token.secret
# pin = 27595
# client.authorize_from_request(rtoken, rsecret, pin)
# client.authorize_from_access("8d680cb1-b9d0-4d24-9ca6-af042547b435", "91acf96c-4d05-4024-8cac-f99dfa7e31b8")  this one
# client.profile(:url => 'http://www.linkedin.com/in/tiffanytkaiser/', :fields => ['headline', 'first_name', 'last_name', 'picture_url', 'location:(name)'] this one


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











