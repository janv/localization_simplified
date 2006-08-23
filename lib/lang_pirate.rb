# lang_pirate.rb
# Pirate baseline translation file. 
# Translated by Tobias Michaelsen , additions by Jesper Rønn-Jensen ( http://justaddwater.dk/ )


module LocalizationSimplified
  About = {
    :lang => "pirate",
    :updated => "2006-08-23"
  }

  class ActiveRecord
    ErrorMessages = {
      :inclusion           => "be not included in the list, me hearty",
      :exclusion           => "be reserrrrved",
      :invalid             => "be innvalid, m hearty",
      :confirmation        => "doesn't match confirmation",
      :accepted            => "must be accepted, arrrrh!",
      :empty               => "no nay ne'er be empty",
      :blank               => "no nay be blank, ye scurvy dog!",
      :too_long            => "be too vastly in length (no more than %d characters or ye drivin' me nuts)",
      :too_short           => "be way too short (at least %d characters or ye drivin' me nuts)",
      :wrong_length        => "be the wrong length (should be %d characters)",
      :taken               => "has already been taken",
      :not_a_number        => "be not a number, matey",
      #Jespers additions:
      :error_translation   => "errrorrr",
      :error_header        => "Ohoy! %s prohibited ye %s from bein' saved",
      :error_subheader     => "Turn the steering wheeel and corrrect these fields, arrrrh."
    }
  end

  class DateHelper
    Texts = {
      :less_than_x_seconds => "less than %d seconds",
      :half_a_minute       => "half arrr minute",
      :less_than_a_minute  => "less than arrr minute",
      :one_minute          => "1 minute ye landlubber",
      :x_minutes           => "%d minutes accounted ferrrr",
      :one_hour            => "about one hourrr and a bottle of rum",
      :x_hours             => "about %d hourrrs and a bottle of rum",
      :one_day             => "1 day and a dead mans chest arrr",
      :x_days              => "%d days and a ship full of hornpipes"
    }
    Monthnames     = [nil] + %w{Januarrry Februarrry Marrrch April May June July August Sebtemberrr Octoberrr Novemberrr Decemberrr}
    AbbrMonthnames = [nil] + %w{Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec}
    Daynames       = %w{Sunday Monday Tuesday Wednesday Thurrrrrrsday Frrriday Saturrrrday}
    AbbrDaynames   = %w{Sun Mon Tue Wed Thurrrr Frri Sat}
    
    DateFormats = {
      :default  => "%Y-%m-%d",
      :short    => "%b %e",
      :long     => "%B %e, %Y"
    }

    TimeFormats = {
      :default  => "%A, %d %b %Y %H:%M:%S",
      :short    => "%d %b %H:%M",
      :long     => "%B %d, %Y %H:%M"
    }
    DateSelectOrder = {
      :order    => [:year, :month, :day] #default Rails is US ordered: :order => [:year, :month, :day]
    }
  end

  class NumberHelper
    CurrencyOptions = {
      :unit      => "pieces o' silver",
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
