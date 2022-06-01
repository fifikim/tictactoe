require 'i18n'

class Translator
  def initialize(locale_sym)
    @translator = I18n

    @translator.load_path << Dir[File.expand_path("locales") + "/*.yml"]
    @translator.default_locale = :en
  end

  def switch_locale(locale_sym)
    @translator.locale = locale_sym
  end

  
end