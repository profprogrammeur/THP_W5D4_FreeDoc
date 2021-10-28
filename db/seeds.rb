# This file contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# To reset  =>    rake db:drop db:create db:migrate then rails db:migrate and rails db:seed

require 'faker'

nb_cities = 5
nb_doctors = 10
nb_patients = 100
nb_appointments = 150

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
City.destroy_all

nb_cities.times do |i|
  City.create!(
    name: Faker::Address.city,
  )
end

nb_doctors.times do
  Doctor.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    specialty: Faker::Educator.course_name.tr("0-9", ""),
    zip_code: Faker::Address.zip_code[0,5],
    city: City.all.sample,
    )
end

nb_patients.times do
  Patient.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: City.all.sample,
    )
end

nb_appointments.times do
  this_doctor = Doctor.all.sample
  Appointment.create!(
    doctor_id:  this_doctor.id,
    patient: Patient.all.sample,
    date: Faker::Time.forward(days: 5,  period: :day, format: :short),
    city_id: this_doctor.city_id,
    )
end


  puts "end seeds"
