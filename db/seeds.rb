# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# To reset  =>    rake db:drop db:create db:migrate
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
City.destroy_all

10.times do |i|
  City.create!(
    name: Faker::Address.city,
  )
end

10.times do
  Doctor.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    specialty: Faker::Educator.course_name,
    zip_code: Faker::Address.zip_code,
    city: City.all.sample,
    )
end

100.times do
  Patient.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: City.all.sample,
    )
end

150.times do
  Appointment.create!(
    doctor:  Doctor.all.sample,
    patient: Patient.all.sample,
    date: Faker::Time.forward(days: 5,  period: :day, format: :short),
    city: City.all.sample,
    )
end


  puts "end seeds"
