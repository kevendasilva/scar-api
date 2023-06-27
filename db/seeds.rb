# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

user_name_first = "User First"
user_email_first = "userf@scar.co"
user_password_first = "userfirst123"

user_name_second = "User Second"
user_email_second = "users@scar.co"
user_password_second = "usersecond123"

# Número gerado de cada recurso
door_locks_count = 6
clients_count = 18
updates_count = 24

# Limpando dados existentes no banco de dados
puts ">> Limpando o banco de dados"
puts ">> Removendo clientes..."
Client.destroy_all
puts ">> Removendo fechaduras..."
DoorLock.destroy_all
puts ">> Removendo atualizações..."
Update.destroy_all
puts ">> Removendo usuários..."
User.destroy_all

puts ">> Criando o primeiro usuário"
User.create!(
  email: user_email_first,
  password: user_password_first,
  name: user_name_first
)

puts ">> Criando o segundo usuário"
User.create!(
  email: user_email_second,
  password: user_password_second,
  name: user_password_second
)

users = User.all

puts ">> Criando conjunto de fechaduras"
door_locks_count.times do
  DoorLock.create!(
    name: Faker::Lorem.word,
    open: Faker::Boolean.boolean,
    user: users.sample
  )
end

door_locks = DoorLock.all

puts ">> Criando conjunto de clientes"
clients_count.times do
  Client.create!(
    name: Faker::Name.name,
    key: Faker::Lorem.word,
    key_type: Client.key_types.keys.sample,
    allowed: Faker::Boolean.boolean,
    door_lock: door_locks.sample
  )
end

puts ">> Criando conjunto de atualizações"
updates_count.times do
  client = Client.all.sample 
    
  Update.create!(
    key_type: client.key_type,
    person_name: client.name,
    open: Faker::Boolean.boolean,
    door_lock: door_locks.sample
  )
end
