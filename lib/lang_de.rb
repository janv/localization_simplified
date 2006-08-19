# lang_de.rb
# German translation file
# Translation by Jesper Rønn-Jensen ( http://justaddwater.dk/ ), inspired by  example on 
# Rails wiki: http://wiki.rubyonrails.org/rails/pages/OverridingRailsMessagesInAnotherLanguage

module LocalizationSimplified
  About = {
    :lang => "de",
    :updated => "2006-08-17"
  }

  class ActiveRecord
    ErrorMessages = {
      :inclusion           => "ist nicht in Liste gültiger Optionen enthalten",
      :exclusion           => "ist reserviert",
      :invalid             => "ist ungültig",
      :confirmation        => "entspricht nicht der Best�tigung",
      :accepted            => "muß akzeptiert werden",
      :empty               => "darf nicht leer sein",
      :blank               => "darf nicht leer sein",
      :too_long            => "ist zu lang (höchstens %d Zeichen)",
      :too_short           => "ist zu kurz (mindestens %d Zeichen)",
      :wrong_length        => "hat eine falsche Länge (es sollten %d Zeichen sein)",
      :taken               => "ist schon vergeben",
      :not_a_number        => "ist keine Zahl",
      #Jespers additions:
      :error_translation   => "Fehl",
      :error_header        => "%s verhinderte dieser %s gespeichert werden",
      :error_subheader     => "Es gab probleme mit dem folgenden:"
    }
  end

  class DateHelper
    Texts = {
      :less_than_x_seconds => "weniger als %d Sekunden",
      :half_a_minute       => "hälfte ein Minute",
      :less_than_a_minute  => "weniger als ein Minute",
      :one_minute          => "1 minute",
      :x_minutes           => "%d Minuten",
      :one_hour            => "ungefähr  1 Stunden",
      :x_hours             => "ungefähr %d Stunden",
      :one_day             => "1 Tag",
      :x_days              => "%d Tage"
    }
    Monthnames     = [nil] + %w{Januar Februar Märtz April Mai Juni Juli August September Oktober November Dezember}
    AbbrMonthnames = [nil] + %w{Jan Feb Mrz Apr Mai Jun Jul Aug Sep Oct Nov Dez}
    Daynames       = %w{Sontag Montag Dienstag Mittwoch Donnerstag Freitag Samstag}
    AbbrDaynames   = %w{Son Mon Die Mit Don Fre Sam}
    
    DateFormats = {
      :default  => "%Y-%m-%d",
      :short    => "%b %e",
      :long     => "%B %e, %Y"
    }

    TimeFormats = {
      :default  => "%a, %d %b %Y %H:%M:%S %z",
      :short    => "%d %b %H:%M",
      :long     => "%B %d, %Y %H:%M"
    }
  end

  class NumberHelper
    CurrencyOptions = {
      :unit => "EUR ",
      :separator => ",",
      :delimiter => ".",
      :order => nil
    }
  end
    
	class ArrayHelper
		ToSentenceTexts = {
			:connector => 'und', 
			:skip_last_comma => true
		}
  end
end


# Use the inflector below to translate "error" from
# @@default_error_messages[:error_translation] above (if necessary)
 Inflector.inflections do |inflect|
   inflect.plural /^(Fehl)$/i, '\1er'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person people'
#   inflect.uncountable %w( information )
 end
