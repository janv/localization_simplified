# lang_es.rb
# Spanish translation file. 
# Translation by Luis Villa del Campo (www.grancomo.com)


module LocalizationSimplified
  About = {
    :lang => "es",
    :updated => "2006-08-17"
  }

  class ActiveRecord
    ErrorMessages = {
      :inclusion           => "no está incluido en la lista",
      :exclusion           => "está reservado",
      :invalid             =>  "no es válido",
      :confirmation        => "no coincide con la conformación",
      :accepted            => "debe ser aceptado",
      :empty               => "no puede estar vacío",
      :blank               => "no puede estar en blanco",
      :too_long            => "es demasiado largo (el máximo es %d caracteres)",
      :too_short           => "es demasiado cordo (el minimo es %d caracteres)",
      :wrong_length        => "is the wrong length (should be %d characters)",
      :taken               => "ya está ocupado",
      :not_a_number        => "no es un número",
      #Jespers additions:
      :error_translation   => "error",
      :error_header        => "%s no permite guardar %s",
      :error_subheader     => "Ha habido problemas con los siguientes campos:"
    }
  end

  class DateHelper
    Texts = {
      :less_than_x_seconds => "menos de %d segundos",
      :half_a_minute       => "medio minuto",
      :less_than_a_minute  => "menos de un minuto",
      :one_minute          => "1 minuto",
      :x_minutes           => "%d minutos",
      :one_hour            => "sobre una hora",
      :x_hours             => "sobre %d horas",
      :one_day             => "un día",
      :x_days              => "%d días"
    }
    Monthnames     = [nil] + %w{enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre}
    AbbrMonthnames = [nil] + %w{ene feb mar abr may jun jul ago sep oct nov dic}
    Daynames       = %w{domingo lunes martes miércoles jueves viernes sábado}
    AbbrDaynames   = %w{dom lun mar mié jue vie sáb }
    
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
      :unit      => "EUR ",
      :separator => ",",
      :delimiter => ".",
      :order => nil
    }
  end
    
  class ArrayHelper
    ToSentenceTexts = {
      :connector => 'y', 
      :skip_last_comma => true
    }
  end
end


# Use the inflector below to translate "error" from
# @@default_error_messages[:error_translation] above (if necessary)
 Inflector.inflections do |inflect|
   inflect.plural /^(error)$/i, '\1es'
 end