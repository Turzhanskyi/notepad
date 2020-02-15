# frozen_string_literal: true

class Link < Post
  def initialize
    super

    @url = ''
  end

  def read_from_console
    puts 'Адреса посилання:'
    @url = STDIN.gets.chomp

    puts 'Що за посилання?'
    @url = STDIN.gets.chomp
  end

  def to_strings
    time_string = "Створено: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')} \n\r \n\r"

    [@url, @text, time_string]
  end

  def to_db_hash
    super.merge(
      text: @text,
      url: @url
    )
  end
end
