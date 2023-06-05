require 'faker'

#super usuario
User.create!(
  name: 'Estaban',
  email: 'estaban@job.com',
  password: 'admin123456',
  password_confirmation: 'admin123456',
  admin: true
)

# Crea 10 empleos falsos
10.times do
  title = Faker::Job.title
  description = Faker::Lorem.paragraph(sentence_count: 2)
  Job.create(title: title, description: description)
end
