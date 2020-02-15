# frozen_string_literal: true

require 'date'

class Task < Post
  def initialize
    super

    @due_date = Time.now
  end

  def read_from_console
    puts 'Що треба зробити?'
    @text = STDIN.gets.chomp

    puts 'До якого числа? Вкажіть дату в форматі ДД.ММ.РРРР,' \
      'наприклад 15.02.2020'
    input = STDIN.gets.chomp

    @due_date = Date.parse(input)
  end

  def to_strings
    deadline = "Реченець: #{@due_date.strftime('%Y.%m.%d')}"
    time_string = "Створено: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')} \n\r"

    [deadline, @text, time_string]
  end

  def to_db_hash
    super.merge(text: @text, due_date: @due_date.to_s)
  end

  def load_data(data_hash)
    super

    @due_date = Date.parse(data_hash['due_date'])
  end
end
