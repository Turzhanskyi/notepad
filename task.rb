# frozen_string_literal: true

require 'date'

class Task < Post
  def initialize
    super

    @due_date = Time.now
  end

  def read_from_console
    puts 'Що необхідно зробити?'
    @text = STDIN.gets.chomp

    puts 'Термін виконання? Вкажіть дату в форматі ДД.ММ.РРРР, наприклад 14.02.2020'
    input = STDIN.gets.chomp

    @due_date = Date.parse(input)
  end

  def to_strings
    time_string = "Створено: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')} \n\r \n\r"

    deadline = "Реченець: #{@due_date}"

    [deadline, @text, time_string]
  end

  def to_db_hash
    super.merge(
      text: @text,
      due_date: @due_date.to_s
    )
  end
end
