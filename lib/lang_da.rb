# lang_da.rb
# Danish translation file
# Translation by Jesper Rønn-Jensen ( http://justaddwater.dk/ ) 


module LocalizationSimplified
  About = {
    :lang => "da",
    :updated => "2006-08-17"
  }

  class ActiveRecord
    ErrorMessages = {
      :inclusion           => "er ikke med på listen",
      :exclusion           => "er et reserveret ord",
      :invalid             => "er ugyldig",
      :confirmation        => "matcher ikke med bekræftelsen",
      :accepted            => "skal accepteres",
      :empty               => "kan ikke være tom",
      :blank               => "kan ikke være blank",
      :too_long            => "er for langt (max er %d tegn)",
      :too_short           => "er for kort (minimum er %d tegn)",
      :wrong_length        => "har forkert længde (skal være %d tegn)",
      :taken               => "er allerede taget",
      :not_a_number        => "er ikke et tal",
      #Jespers additions:
      :error_translation   => "fejl",
      :error_header        => "%s forhindrede %s i at blive gemt",
      :error_subheader     => "Problemer med følgende felter:"
    }
  end

  class DateHelper
    Texts = {
      :less_than_x_seconds => "under %d sekunder",
      :half_a_minute       => "et halvt minut",
      :less_than_a_minute  => "under et minut",
      :one_minute          => "1 minut",
      :x_minutes           => "%d minutter",
      :one_hour            => "omkring en time",
      :x_hours             => "omkring %d timer",
      :one_day             => "1 dag",
      :x_days              => "%d dage"
    }
    Monthnames     = [nil] + %w{januar februar marts april maj juni juli august september oktober november december}
    AbbrMonthnames = [nil] + %w{jan feb mar apr maj jun jul aug sep okt nov dec}
    Daynames       = %w{søndag mandag tirsdag onsdag torsdag fredag lørdag}
    AbbrDaynames   = %w{søn man tir ons tors fre lør}
    
    DateFormats = {
      :default  => "%Y-%m-%d",
      :short    => "%e %b",
      :long     => "%e %B, %Y"
    }

    TimeFormats = {
      :default  => "%d %b %Y %H:%M",
      :short    => "%d %b %H:%M",
      :long     => "%d %B %Y %H:%M"
    }
  end

  class NumberHelper
    CurrencyOptions = {
      :unit      => "kr. ",
      :separator => ",",
      :delimiter => ".",
      :order => nil
      #to support for instance Danish format, the order is different: Unit comes last (ex. "1.234,00 dkr.")
    }
  end

  class ArrayHelper
    ToSentenceTexts = {
      :connector => 'og', 
      :skip_last_comma => true
    }
  end
end


# Use the inflector below to translate "error" from
# @@default_error_messages[:error_translation] above (if necessary)
 Inflector.inflections do |inflect|
   inflect.uncountable %w( fejl )
 end
