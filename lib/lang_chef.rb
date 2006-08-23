# lang_chef.rb
# Swedish Chef language file for Ruby on Rails
# Translation by Jesper Rønn-Jensen ( http://justaddwater.dk/ ), via web based translator 


module LocalizationSimplified
  About = {
    :lang => "chef",
    :updated => "2006-08-23"
  }

  class ActiveRecord
    ErrorMessages = {
      :inclusion           => "is nut inclooded in zee leest",
      :exclusion           => "is reserfed",
      :invalid             => "is infeleed",
      :confirmation        => "duesn't metch cunffurmeshun",
      :accepted            => "moost be-a eccepted",
      :empty               => "cun't be-a impty",
      :blank               => "cun't be-a blunk",
      :too_long            => "is tuu lung (mexeemoom is %d cherecters)",
      :too_short           => "is tuu shurt (meenimoom is %d cherecters)",
      :wrong_length        => "is zee vrung lengt (shuoold be-a %d cherecters)",
      :taken               => "hes elreedy beee tekee",
      :not_a_number        => "is nut a noomber",
      #Jespers additions:
      :error_translation   => "irrur",
      :error_header        => "%s pruheebited thees %s frum beeeng sefed",
      :error_subheader     => "Zeere-a vere-a prublems veet zee fullooeeng feeelds:"
    }
  end

  class DateHelper
    Texts = {
      :less_than_x_seconds => "less thun %d secunds",
      :half_a_minute       => "helff a meenoote-a",
      :less_than_a_minute  => "less thun a meenoote-a",
      :one_minute          => "1 meenoote-a",
      :x_minutes           => "%d meenootes",
      :one_hour            => "ebuoot 1 huoor",
      :x_hours             => "ebuoot %d huoors",
      :one_day             => "1 dey",
      :x_days              => "%d deys"
    }
    Monthnames     = [nil] + %w{Junooery Febrooery Merch Epreel Mey Joone-a Jooly Oogoost Seeptembooor Ooctuber Nufember Deezember}
    AbbrMonthnames = [nil] + %w{Jun Feb Mer Epr Mey Joon Jool Oog Sep Ooct Nuf Deez}
    Daynames       = %w{Soondey Mundey Tooesdey Vednesdey Thoorsdey Freedey Setoordey}
    AbbrDaynames   = %w{Soon Mun Tooe-a Ved Thoo Free Set}
    
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
    }
  end

  class ArrayHelper
    ToSentenceTexts = {
      :connector => 'eend',
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
