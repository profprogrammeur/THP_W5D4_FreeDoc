# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# To reset  =>    rake db:drop db:create db:migrate
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Doctor.delete_all
Patient.delete_all
Appointment.delete_all
# City.delete_all

10.times do
  user = Patient.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name)
end
10.times do
  user = Doctor.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    specialty: Faker::Educator.course_name,
    zip_code: Faker::Address.zip_code
    )
end
20.times do
  Appointment.create!(
    doctor_id: Faker::Number.between(from:1, to:5),
    patient_id: Faker::Number.between(from:1, to:5),
    date: Faker::Time.forward(days: 5,  period: :day, format: :short)
  )
end

# 10.times do |i|
#   City.create!(
#     name: Faker::Address.city,
#   )
# end
#   puts "Cities created!"
