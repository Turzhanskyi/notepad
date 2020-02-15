# frozen_string_literal: true

require_relative 'post'
require_relative 'memo'
require_relative 'link'
require_relative 'task'

require 'optparse'

options = {}

OptionParser.new do |opt|
  opt.banner = 'Usage: read.rb [options]'

  opt.on('-h', 'Prints this help') do
    puts opt
    exit
  end

  opt.on('--type POST_TYPE', 'який тип постів показувати ' \
         '(за замовчуванням: будь-який)') { |o| options[:type] = o }
  opt.on('--id POST_ID', 'якщо заданий id - показуємо детально ' \
         ' тільки цей пост') { |o| options[:id] = o }
  opt.on('--limit NUMBER', 'скільки останніх постів показати' \
         '(за замовчуванням: всі)') { |o| options[:limit] = o }
end.parse!

result = if options[:id].nil?
           Post.find_all(options[:limit], options[:type])
         else
           Post.find_by_id(options[:id])
         end

if result.is_a? Post
  puts "Запис #{result.class.name}, id = #{options[:id]}"

  result.to_strings.each { |line| puts line }
else
  print '| id                 '
  print '| @type              '
  print '| @created_at        '
  print '| @text              '
  print '| @url               '
  print '| @due_date          '
  print '|'

  result.each do |row|
    puts

    row.each do |element|
      element_text = "| #{element.to_s.delete('\\n\\r')[0..40]}"
      print element_text
    end

    print '|'
  end

  puts
end
