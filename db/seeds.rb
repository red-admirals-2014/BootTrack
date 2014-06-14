# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


@grads = Graduate.grad_name

@grads.each do |grad|
  Graduate.create(cohort_id: grad["cohort_id"], name: grad["name"], email: grad["email"], linked_in: grad["linked_in"])
end
