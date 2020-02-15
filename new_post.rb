# frozen_string_literal: true

# Програма «Блокнот», що демонструє наслідування класів в ruby.
# Версія 2.0, що зберігає свої дані в базі даних SQLite
# Цей скрипт створює нові записи, читанням займається інший скрипт

require_relative 'post'
require_relative 'memo'
require_relative 'link'
require_relative 'task'

puts 'Привіт, я твій блокнот!'
puts 'Версія 2, записую нові записи в базу SQLite'
puts
puts 'Що хочете записати в блокнот?'

choices = Post.post_types.keys

choice = -1
until choice >= 0 && choice < choices.size
  choices.each_with_index do |type, index|
    puts "\t#{index}. #{type}"
  end
  choice = gets.to_i
end

entry = Post.create(choices[choice])

entry.read_from_console

rowid = entry.save_to_db

puts "Запис збережено в базі даних, id = #{rowid}"
