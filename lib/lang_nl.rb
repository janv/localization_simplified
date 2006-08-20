# lang_nl.rb
# Dutch translation by Jeroen Houben



module LocalizationSimplified
 About = {
   :lang => "nl",
   :updated => "2006-08-20"
 }

 class ActiveRecord
   ErrorMessages = {
     :inclusion           => "zit niet in de lijst",
     :exclusion           => "is gereserveerd",
     :invalid             => "is ongeldig",
     :confirmation        => "is niet hetzelfde als de verificatie",
     :accepted            => "moet worden geaccepteerd",
     :empty               => "mag niet leeg zijn",
     :blank               => "mag niet blanko zijn",
     :too_long            => "is te land (maximum is %d karakters)",
     :too_short           => "is te kort (minimum is %d karakters)",
     :wrong_length        => "is de verkeerde lengte (dient %d karakters te zijn)",
     :taken               => "is reeds in gebruik",
     :not_a_number        => "is geen nummer",
     #Jespers additions:
     :error_translation   => "fout",
     :error_header        => "%s zorgen ervoor dat %s niet kan worden opgeslagen",
     :error_subheader     => "Er zijn problemen met de volgende velden:"
   }
 end

 class DateHelper
   Texts = {
     :less_than_x_seconds => "minder dan %d seconden",
     :half_a_minute       => "een halve minuut",
     :less_than_a_minute  => "minder dan een halve minuut",
     :one_minute          => "1 minuut",
     :x_minutes           => "%d minuten",
     :one_hour            => "ongeveer 1 uur",
     :x_hours             => "ongeveer %d uur",
     :one_day             => "1 dag",
     :x_days              => "%d dagen"
   }
   Monthnames     = [nil] + %w{Januari Februari Maart April Mei Juni July Augustus September October November December}
   AbbrMonthnames = [nil] + %w{Jan Feb Mar Apr Mei Jun Jul Aug Sep Oct Nov Dec}
   Daynames       = %w{Zondag Maandag Dinsdag Woensdag Donderdag Vrijdag Zaterdag}
   AbbrDaynames   = %w{Zo Ma Di Wo Do Vr Za}

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
     :unit      => "€",
     :separator => ".",
     :delimiter => ",",
     :order => nil
     #to support for instance Danish format, the order is different: Unit comes last (ex. "1.234,00 dkr.")
   }
 end

 class ArrayHelper
   ToSentenceTexts = {
     :connector => 'en',
     :skip_last_comma => false
   }
 end
end


# Use the inflector below to translate "error" from
# @@default_error_messages[:error_translation] above (if necessary)
 Inflector.inflections do |inflect|
   inflect.plural /^(fout)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person people'
#   inflect.uncountable %w( information )
 end
