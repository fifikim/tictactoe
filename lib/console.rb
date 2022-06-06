# frozen_string_literal: true

require_relative 'translator'

class Console
  def initialize(*)
    @translator = Translator.new
  end

  def switch_language(language_sym)
    @translator.switch_locale(language_sym)
  end

  def translate(message_key)
    @translator.translate(message_key)
  end

  def output(message)
    puts message
  end
end
