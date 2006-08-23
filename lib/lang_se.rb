# lang_se.rb
# Swedish translation file. 
# Translation from plugin swe_rails by Ola Bini ( http://ola-bini.blogspot.com/ ) and Olle Johnsson ( http://olleolleolle.dk )


module LocalizationSimplified
  About = {
    :lang => "se",
    :updated => "2006-08-23"
  }

  class ActiveRecord
    ErrorMessages = {
      :inclusion           => "finns inte i listan",
      :exclusion           => "Är reserverat",
      :invalid             => "Är ogiltigt",
      :confirmation        => "stämmer inte övererens",
      :accepted            => "måste vara accepterad",
      :empty               => "för ej vara tom",
      :blank               => "för ej vara blank",
      :too_long            => "Är för lång (maximum är %d tecken)",
      :too_short           => "Är för kort (minimum är %d tecken)",
      :wrong_length        => "har fel längd (ska vara %d tecken)",
      :taken               => "har redan tagits",
      :not_a_number        => "Är ej ett nummer",
      #Jespers additions:
      :error_translation   => "fel",
      :error_header        => "%s förhindrade %s från at sparse",
      :error_subheader     => "Problemar met dissa felterne:"
    }
  end

  class DateHelper
    Texts = {
      :less_than_x_seconds => "mindre än %d sekunder",
      :half_a_minute       => "en halv minut",
      :less_than_a_minute  => "mindre än en minut",
      :one_minute          => "1 minut",
      :x_minutes           => "%d minutter",
      :one_hour            => "ungefär 1 timma",
      :x_hours             => "ungefär %d timmar",
      :one_day             => "1 dygn",
      :x_days              => "%d dygn"
    }
    Monthnames     = [nil] + %w{januari februari mars april maj juni juli augusti september oktober november december}
    AbbrMonthnames = [nil] + %w{jan feb mar apr maj jun jul aug sep okt nov dec}
    Daynames       = %w{söndag måndag tisdag onsdag torsdag fredag lördag}
    AbbrDaynames   = %w{sön mån tis ons tors fre lör}

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
    DateSelectOrder = {
      :order    => [:day, :month, :year] #default Rails is US ordered: :order => [:year, :month, :day]
    }
  end

  class NumberHelper
    CurrencyOptions = {
      :unit      => "kr. ",
      :separator => ",",
      :delimiter => ".",
      :order => nil
      #to support for instance Swedish format, the order is different: Unit comes last (ex. "1.234,00 kr.")
    }
  end

  class ArrayHelper
    ToSentenceTexts = {
      :connector => 'och', 
      :skip_last_comma => true
    }
  end
end


# Use the inflector below to translate "error" from
# @@default_error_messages[:error_translation] above (if necessary)
 Inflector.inflections do |inflect|
   inflect.uncountable %w( fel )
 end
