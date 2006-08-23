# lang_en.rb
# English baseline translation file. Comes in handy for testing purposes



module LocalizationSimplified
  About = {
    :lang => "en",
    :updated => "2006-08-23"
  }

  class ActiveRecord
    ErrorMessages = {
      :inclusion           => "is not included in the list",
      :exclusion           => "is reserved",
      :invalid             => "is invalid",
      :confirmation        => "doesn't match confirmation",
      :accepted            => "must be accepted",
      :empty               => "can't be empty",
      :blank               => "can't be blank",
      :too_long            => "is too long (maximum is %d characters)",
      :too_short           => "is too short (minimum is %d characters)",
      :wrong_length        => "is the wrong length (should be %d characters)",
      :taken               => "has already been taken",
      :not_a_number        => "is not a number",
      #Jespers additions:
      :error_translation   => "error",
      :error_header        => "%s prohibited this %s from being saved",
      :error_subheader     => "There were problems with the following fields:"
    }
  end

  class DateHelper
    Texts = {
      :less_than_x_seconds => "less than %d seconds",
      :half_a_minute       => "half a minute",
      :less_than_a_minute  => "less than a minute",
      :one_minute          => "1 minute",
      :x_minutes           => "%d minutes",
      :one_hour            => "about 1 hour",
      :x_hours             => "about %d hours",
      :one_day             => "1 day",
      :x_days              => "%d days"
    }
    Monthnames     = [nil] + %w{January February March April May June July August September October November December}
    AbbrMonthnames = [nil] + %w{Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec}
    Daynames       = %w{Sunday Monday Tuesday Wednesday Thursday Friday Saturday}
    AbbrDaynames   = %w{Sun Mon Tue Wed Thu Fri Sat}
    
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
      :order    => [:year, :month, :day] #default Rails is US ordered: :order => [:year, :month, :day]
    }
  end

  class NumberHelper
    CurrencyOptions = {
      :unit      => "$",
      :separator => ".",
      :delimiter => ",",
      :order => nil
      #to support for instance Danish format, the order is different: Unit comes last (ex. "1.234,00 dkr.")
    }
  end

  class ArrayHelper
    ToSentenceTexts = {
      :connector => 'and',
      :skip_last_comma => false
    }
  end
end


# Use the inflector below to translate "error" from
# @@default_error_messages[:error_translation] above (if necessary)
# Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person people'
#   inflect.uncountable %w( information )
# end
