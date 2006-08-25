# lang_fr.rb
# Traduction française des messages d'erruer. A compléter ou corriger.
# Translation by Frédéric Cavazza ( www.fredcavazza.net )


module LocalizationSimplified
  About = {
    :lang => "fr",
    :updated => "2006-08-24"
  }

  class ActiveRecord
    ErrorMessages = {
      :inclusion           => "n'est pas inclut dans la liste",
      :exclusion           => "est réservé",
      :invalid             => "est invalide",
      :confirmation        => "ne correspond pas à la confirmation",
      :accepted            => "doit être accepté",
      :empty               => "ne peut pas être vide",
      :blank               => "ne peut pas être vierge",
      :too_long            => "est trop long (%d caractères maximum)",
      :too_short           => "est trop court(%d caractères minimum)",
      :wrong_length        => "n'est pas de la bonne longueur (devrait être de %d caractères)",
      :taken               => "est déjà prit",
      :not_a_number        => "n'est pas le nombre",
      #Jespers additions:
      :error_translation   => "erreur",
      :error_header        => "%s interdit ce %s d'être sauvegardé",
      :error_subheader     => "Il y a des problèmes avec les champs suivants :"
    }
  end

  class DateHelper
    Texts = {
      :less_than_x_seconds => "moins de %d secondes",
      :half_a_minute       => "une demi-minute",
      :less_than_a_minute  => "moins d'une minute",
      :one_minute          => "1 minute",
      :x_minutes           => "%d minutes",
      :one_hour            => "à peut près 1 heure",
      :x_hours             => "à peu près %d heures",
      :one_day             => "1 jour",
      :x_days              => "%d jours"
    }
    Monthnames     = [nil] + %w{Janvier Février Mars Avril Mai Juin Juillet Août Septembre Octobre Novembre Decembre}
    AbbrMonthnames = [nil] + %w{Jan Fev Mar Avr Mai Jui Jul Aoû Sep Oct Nov Dec}
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
      :unit      => "€",
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
