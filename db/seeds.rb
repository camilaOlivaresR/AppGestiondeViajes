# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
admin =   User.create!(
    name: 'Administrador',
    email: 'administrador@mail.com',
    password: 'Abc123#', 
    password_confirmation: 'Abc123#',
    role: %w[admin].sample 
    )

usuario =   User.create!(
    name: 'Usuario',
    email: 'usuario@mail.com',
    password: 'Abc123#', 
    password_confirmation: 'Abc123#',
    role: %w[normal_user].sample 
    )

    # Generar 6 usuarios aleatorios
6.times do
    User.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: 'password', # Puedes cambiar la contraseña si lo prefieres
      password_confirmation: 'password',
      role: %w[normal_user].sample # Selecciona al azar entre 'conductor' y 'supervisor'
    )
  end

  20.times do
    Itinerary.create!(
      name: Faker::Lorem.paragraph(sentence_count: 2),
      description: Faker::Lorem.paragraph(sentence_count: 2),  # Genera una descripción aleatoria
      star_date: Faker::Date.backward(days: 30),  # Genera una fecha de salida en los últimos 30 días
      end_date: Faker::Date.forward(days: 10),  # Genera una fecha de llegada en los próximos 10 días
      user_id: User.pluck(:id).sample  # Selecciona un usuario al azar
    )
  end