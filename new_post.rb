# frozen_string_literal: true

require_relative 'post.rb'
require_relative 'link.rb'
require_relative 'memo.rb'
require_relative 'task.rb'

puts 'Привіт, я твій записник! Версія 2 + Sqlite'
puts 'Що хочете записати?'

choices = Post.post_types.keys

choice = -1

until choice >= 0 && choice < choice.size

  choices.each_with_index { |type, index| puts "\t#{index}. #{type}" }

  choice = STDIN.gets.chomp.to_i
end

entry = Post.create(choices[choice])

entry.read_from_console

id = entry.save_to_db

puts "Запис збережено! Id = #{id}"