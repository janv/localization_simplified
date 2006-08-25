# lang_cf.rb
# french canadian translation file
# Translation by Daniel Lepage ( http://www.solulabs.com/ ), inspired by example on

module LocalizationSimplified
  About = {
    :lang => "cf",
    :updated => "2006-08-24"
  }
 
  class ActiveRecord
    ErrorMessages = {
      :inclusion           => "n'est pas inclus dans la liste",
      :exclusion           => "est réservé",
      :invalid             => "est non valide",
      :confirmation        => "ne correspond pas à la confirmation",
      :accepted            => "doit être accepté",
      :empty               => "ne peut pas être vide",
      :blank               => "ne peut pas être laissé à blanc",
      :too_long            => "dépasse la longueur permise (le maximum étant de %d caractères)",
      :too_short           => "est trop court (le minimum étant de %d caractères)",
      :wrong_length        => "n'est pas de la bonne longueur (doit être de %d caractères)",
      :taken               => "as déjà été pris",
      :not_a_number        => "n'est pas un nombre",
      #Jespers additions:
      :error_translation   => "erreur",
      :error_header        => "%s interdit d'enregistrer %s ",
      :error_subheader     => "Il y a des erreurs dans les champs suivants : "
    }
  end
 
  class DateHelper
    Texts = {
      :less_than_x_seconds => "moins de %d secondes",
      :half_a_minute       => "30 secondes",
      :less_than_a_minute  => "moins d'une minute",
      :one_minute          => "1 minute",
      :x_minutes           => "%d minutes",
      :one_hour            => "environ 1 heure",
      :x_hours             => "environ %d heures",
      :one_day             => "1 jour",
      :x_days              => "%d jours"
    }
    Monthnames     = [nil] + %w{Janvier Février Mars Avril Mai Juin Juillet Août Septembre Octobre Novembre Décembre}
    AbbrMonthnames = [nil] + %w{Jan Fev Mar Avr Mai Jun Jui Aou Sep Oct Nov Dec}
    Daynames       = %w{Dimanche Lundi Mardi Mercredi Jeudi Vendredi Samedi}
    AbbrDaynames   = %w{Dim Lun Mar Mer Jeu Ven Sam}
 
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
      :connector => 'et',
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
