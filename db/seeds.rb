

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


# all_grads = Graduate.all

# all_grads.each do |grad|
#   url = grad.linked_in
#   if url && url != ""
#     url = url.slice(URI.regexp).gsub(/\/$/, "")
#     if !(url =~ /^https?:/i)
#       url = "http://" + url
#       grad.update_attributes(linked_in: url)
#     end
#   else
#     url = nil
#     grad.update_attributes(linked_in: url)
#   end
# end

# grads = Graduate.all

# grads.each do |grad|
#   url = grad.linked_in
#   client = LinkedIn::Client.new('752jy5l9lpe28m', 'GcvQ6BiPEAST2Q1k')
#   client.authorize_from_access("8d680cb1-b9d0-4d24-9ca6-af042547b435", "91acf96c-4d05-4024-8cac-f99dfa7e31b8")
#   sleep 1
#   begin
#     new_info = client.profile(:url => url , :fields => ['headline', 'picture_url', 'location:(name)'])
#     grad.update_attributes(employer: new_info.headline, location: new_info.location.name, picture: new_info.picture_url)
#   rescue StandardError => e
#     p "Error: #{e}"
#     grad.update_attributes(employer: nil, location: nil, picture: nil)
#   end
#    # grad.update_attributes(employer: new_info.headline, location: new_info.location.name, picture: new_info.picture_url)
# end





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



# https://github.com/hexgnu/linkedin/blob/master/EXAMPLES.md
# client.profile(:url => 'http://www.linkedin.com/in/netherland', :fields => headline/location:(name),first_name, last_name, specialties, picture_url, summary) - these are the fields we eventually want.

# # provides the ability to access authenticated user's company field in the profile
# user = client.profile(:fields => %w(positions))










