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
