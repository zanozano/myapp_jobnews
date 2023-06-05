require 'faker'

#super usuario
User.create!(
  name: 'Estaban',
  email: 'estaban@job.com',
  password: 'admin123456',
  password_confirmation: 'admin123456',
  admin: true
)

#normal usuario
User.create!(
  name: 'Juan',
  email: 'juan@job.com',
  password: '123456',
  password_confirmation: '123456',
  admin: false
)


# Crea 10 empleos falsos
10.times do
  title = Faker::Job.title
  description = Faker::Lorem.paragraph(sentence_count: 4)
  Job.create(title: title, description: description)
end
