# lang_fi.rb
# Finnish translation file. 
# Translation by Jarkko Laine ( http://jlaine.net/ )


module LocalizationSimplified
  About = {
    :lang => "fi",
    :updated => "2006-08-24"
  }

  class ActiveRecord
    ErrorMessages = {
      :inclusion           => "ei löydy listalta",
      :exclusion           => "on varattu",
      :invalid             => "on virheellinen",
      :confirmation        => "ei vastaa vahvistusta",
      :accepted            => "on hyväksyttävä",
      :empty               => "ei voi olla tyhjä",
      :blank               => "ei voi olla tyhjä",
      :too_long            => "on liian pitkä (maksimi on %d merkkiä)",
      :too_short           => "on liian lyhyt (minimi on %d merkkiä)",
      :wrong_length        => "on väärän pituinen (oikea pituus %d merkkiä)",
      :taken               => "on jo varattu",
      :not_a_number        => "ei ole numero",
      #Jespers additions:
      :error_translation   => "virhe",
      :error_header        => "%s esti tämän %s tallentamisen",
      :error_subheader     => "Seuraavat kentät aiheuttivat ongelmia:"
    }
  end

  class DateHelper
    Texts = {
      :less_than_x_seconds => "alle %d sekuntia",
      :half_a_minute       => "puoli minuuttia",
      :less_than_a_minute  => "alle minuutti",
      :one_minute          => "1 minuutti",
      :x_minutes           => "%d minuuttia",
      :one_hour            => "noin tunti",
      :x_hours             => "noin %d tuntia",
      :one_day             => "1 päivä",
      :x_days              => "%d päivää"
    }
    Monthnames     = [nil] + %w{tammikuu helmikuu maaliskuu huhtikuu toukokuu kesäkuu heinäkuu elokuu syyskuu lokakuu marraskuu joulukuu}
    AbbrMonthnames = [nil] + %w{tammi helmi maalis huhti touko kesä heinä elo syys loka marras joulu}
    Daynames       = %w{sunnuntai maanantai tiistai keskiviikko torstai perjantai lauantai}
    AbbrDaynames   = %w{su ma ti ke to pe la}
    
    DateFormats = {
      :default  => "%e.%m.%Y",
      :short    => "%d.%m.",
      :long     => "%e. %Bta %Y"
    }

    TimeFormats = {
      :default  => "%a %Bn %e. %H:%M:%S %Z %Y",
      :short    => "%d.%m.%Y %H:%M",
      :long     => "%a %e. %Bta %Y %T"
    }
    DateSelectOrder = {
      :order    => [:day, :month, :year] #default Rails is US ordered: :order => [:year, :month, :day]
    }
  end

  class NumberHelper
    CurrencyOptions = {
      :unit      => "€",
      :separator => " ",
      :delimiter => ",",
      :order => nil
      #to support for instance Danish format, the order is different: Unit comes last (ex. "1.234,00 dkr.")
    }
  end

  class ArrayHelper
    ToSentenceTexts = {
      :connector => 'ja',
      :skip_last_comma => true
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

