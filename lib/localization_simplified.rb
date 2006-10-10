# LocalizationSimplified
# Really simple localization for Rails
# By Jesper Rønn-Jensen ( http://justaddwater.dk/ )
# Plugin available at http://rubyforge.org/projects/l10n-simplified/
#
module LocalizationSimplified
  @@ignore = "\xFF\xFF\xFF\xFF" # %% == Literal "%" character
  # substitute all daynames and monthnames with localized names
  # from RUtils plugin
  def self.localize_strftime(date='%d.%m.%Y', time='')
    date.gsub!(/%%/, @@ignore)
    date.gsub!(/%a/, LocalizationSimplified::DateHelper::AbbrDaynames[time.wday])
    date.gsub!(/%A/, LocalizationSimplified::DateHelper::Daynames[time.wday])
    date.gsub!(/%b/, LocalizationSimplified::DateHelper::AbbrMonthnames[time.mon])
    date.gsub!(/%B/, LocalizationSimplified::DateHelper::Monthnames[time.mon])
    date.gsub!(@@ignore, '%%')
  end



end


module ActiveRecord
  class Errors
    #Error messages modified in lang file
    @@default_error_messages.update(LocalizationSimplified::ActiveRecord::ErrorMessages)
  end
end

module ActionView
  module Helpers

    #Modify ActiveRecord to use error message headers (text from lang-file)
    module ActiveRecordHelper
      alias_method :old_error_messages_for, :error_messages_for
      def error_messages_for(object_name, options = {})
        messages = ActiveRecord::Errors.default_error_messages
        options = options.symbolize_keys
        object = instance_variable_get("@#{object_name}")
        if object && !object.errors.empty?
          content_tag("div",
            content_tag(
              options[:header_tag] || "h2",
              format( messages[:error_header], pluralize(object.errors.count, messages[:error_translation]), object_name.to_s.gsub("_", " ")  )
              #"#{pluralize(object.errors.count, "error")} prohibited this #{object_name.to_s.gsub("_", " ")} from being saved"
            ) +
            content_tag("p", messages[:error_subheader]) +
            content_tag("ul", object.errors.full_messages.collect { |msg| content_tag("li", msg) }),
            "id" => options[:id] || "errorExplanation", "class" => options[:class] || "errorExplanation"
          )
        else
          ""
        end
      end

    end


    # Modify DateHelper to use text from lang-file
    module DateHelper

      #Modify DateHelper distance_of_time_in_words
      alias_method :old_distance_of_time_in_words, :distance_of_time_in_words
      def distance_of_time_in_words(from_time, to_time = 0, include_seconds = false)
        from_time = from_time.to_time if from_time.respond_to?(:to_time)
        to_time = to_time.to_time if to_time.respond_to?(:to_time)
        distance_in_minutes = (((to_time - from_time).abs)/60).round
        distance_in_seconds = ((to_time - from_time).abs).round

        #First, I invent a variable (makes it easier for future localization)
        messages = LocalizationSimplified::DateHelper::Texts #localized
        case distance_in_minutes
          when 0..1
            return (distance_in_minutes==0) ? messages[:less_than_a_minute] :  messages[:one_minute] unless include_seconds
            case distance_in_seconds
              when 0..5        then format( messages[:less_than_x_seconds], 5 )
              when 6..10       then format( messages[:less_than_x_seconds], 10 )
              when 11..20      then format( messages[:less_than_x_seconds], 20 )
              when 21..40      then messages[:half_a_minute]
              when 41..59      then messages[:less_than_a_minute]
              else                  messages[:one_minute]
            end

          when 2..44           then format(messages[:x_minutes], distance_in_minutes)
          when 45..89          then messages[:one_hour]
          when 90..1439        then format( messages[:x_hours], (distance_in_minutes.to_f / 60.0).round )
          when 1440..2879      then messages[:one_day]
          when 2880..43199     then format( messages[:x_days], (distance_in_minutes / 1440).round )
          when 43200..86399    then messages[:one_month]
          when 86400..525959   then format( messages[:x_months], (distance_in_minutes / 43200).round )
          when 525960..1051919 then messages[:one_year]
          else                      format( messages[:x_years], (distance_in_minutes / 525960).round )
        end
      end
    end
  end
end

# Give default settings to number_to_currency()
module ActionView
  module Helpers
    module NumberHelper
      alias_method :orig_number_to_currency, :number_to_currency
      #modify number_to_currency to accept :order option
      def number_to_currency(number, options = {})
        # Blend default options with localized currency options
        options.reverse_merge!(LocalizationSimplified::NumberHelper::CurrencyOptions)
        options[:order] ||= [:unit, :number]
        options = options.stringify_keys
        precision, unit, separator, delimiter = options.delete("precision") { 2 }, options.delete("unit") { "$" }, options.delete("separator") { "." }, options.delete("delimiter") { "," }
        separator = "" unless precision > 0

        #add leading space before trailing unit
        unit = " " + unit if options["order"] == [:number, :unit]
        output = ''
        begin
          options["order"].each do |param|
            case param
              when :unit
                output << unit
              when :number
                parts = number_with_precision(number, precision).split('.')
                output << number_with_delimiter(parts[0], delimiter) + separator + parts[1].to_s
            end
          end
        rescue
          output = number
        end
        output
      end

    end#module NumberHelper

    module DateHelper
      alias_method :orig_date_select, :date_select

      # Blend default options with localized :order option
      def date_select(object_name, method, options = {})
        options.reverse_merge!(LocalizationSimplified::DateHelper::DateSelectOrder)
        orig_date_select(object_name, method, options)
      end

      alias_method :orig_datetime_select, :datetime_select


      # Blend default options with localized :order option
      def datetime_select(object_name, method, options = {})
        options.reverse_merge!(LocalizationSimplified::DateHelper::DateSelectOrder)
        orig_datetime_select(object_name, method, options)
      end

    end#module DateHelper

    class InstanceTag
      alias_method :orig_to_datetime_select_tag , :to_datetime_select_tag
      # modify datetime_select to accept option :order (default is [:year, :month, :day] )
      # This method is used in datetime_select calls
      def to_datetime_select_tag(options = {})
        defaults = { :discard_type => true }
        options  = defaults.merge(options)
        options_with_prefix = Proc.new { |position| options.merge(:prefix => "#{@object_name}[#{@method_name}(#{position}i)]") }
        datetime = options[:include_blank] ? (value || nil) : (value || Time.now)
        datetime_select = ''
        options[:order] ||= [:year, :month, :day]

        position = {:year => 1, :month => 2, :day => 3}

        discard = {}
        discard[:year]  = true if options[:discard_year]
        discard[:month] = true if options[:discard_month]
        discard[:day]   = true if options[:discard_day] or options[:discard_month]

        options[:order].each do |param|
          datetime_select << self.send("select_#{param}", datetime, options_with_prefix.call(position[param])) unless discard[param]
        end
        datetime_select << " &mdash; " + select_hour(datetime, options_with_prefix.call(4)) unless options[:discard_hour]
        datetime_select << " : "       + select_minute(datetime, options_with_prefix.call(5)) unless options[:discard_minute] || options[:discard_hour]

        datetime_select
      end



    end
  end
end

class Array
  alias :orig_to_sentence :to_sentence
  def to_sentence(options = {})
    #Blend default options with sent through options
    options.reverse_merge!(LocalizationSimplified::ArrayHelper::ToSentenceTexts)
    orig_to_sentence(options)
  end
end

# Modification of ruby constants
class Date
  #FIXME as these are defined as Ruby constants, they can't be overwritten
  MONTHNAMES         = LocalizationSimplified::DateHelper::Monthnames
  ABBR_MONTHNAMES    = LocalizationSimplified::DateHelper::AbbrMonthnames
  #DAYNAMES           = LocalizationSimplified::DateHelper::Daynames        #not in use by Rails
  #ABBR_DAYNAMES      = LocalizationSimplified::DateHelper::AbbrDaynames    #not in use by Rails
end

# Modification of default Time format using Time.to_formatted_s(:default)
# Localizes the hash with the formats  :default, :short, :long
# Usage:
# <% t = Time.parse('2006-12-25 13:55') %>
# <%= t.to_formatted_s(:short) #=> outputs time in localized format %>
# <%= t                        #=> outputs time in localized format %>
class Time
  alias_method :old_strftime, :strftime
  # Pre-translate format of Time before the time string is translated by strftime.
  # The <tt>:default</tt> time format is changed by localizing month and daynames.
  # Also Rails ActiveSupport allow us to modify the <tt>:default</tt> timeformatting string.
  # Originally, its <tt>:default  => "%a, %d %b %Y %H:%M:%S %z"</tt> (RFC2822 names), but as it can be
  # modified in this plugin, and we can end up with a different file format in logfiles, etc
  def strftime(date)
    LocalizationSimplified::localize_strftime(date, self)
    old_strftime(date)
  end
end

# Modification of default Date format using Date.to_formatted_s(:default)
# Localizes the hash with the formats  :default, :short, :long
# Usage:
# <% d = Date.parse('2006-12-25') %>
# <%= d.to_formatted_s(:short) #=> outputs date in localized format %>
#
# FIXME The Time conversion still does not modify week day and month (for some reason)
ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS.merge!(LocalizationSimplified::DateHelper::DateFormats)

# Modification of default Time format using Time.to_formatted_s(:default)
# Localizes the hash with the formats  :default, :short, :long
# Usage:
# <% t = Time.parse('2006-12-25 13:55') %>
# <%= t.to_formatted_s(:short) #=> outputs time in localized format %>
# <%= t                        #=> outputs time in localized format %>
#
# FIXME The Time conversion still does not modify week day and month (for some reason)
ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS.merge!(LocalizationSimplified::DateHelper::TimeFormats)


# Modify Actioncontroller to always use UTF-8
# Currently this modifies MySQL. Please add other databases you find necessary
class ActionController::Base
   before_filter :configure_charsets

  def configure_charsets(charset='utf-8')
    $KCODE = 'u'
    # Response header necessary with some lang-files (like lang_pirate.rb for some reason)
    @response.headers["Content-Type"] = "text/html; charset=utf-8"

    # Set connection charset. MySQL 4.0 doesn't support this so it
    # will throw an error, MySQL 4.1 needs this
    suppress(ActiveRecord::StatementInvalid) do
      ActiveRecord::Base.connection.execute 'SET NAMES UTF8'
    end
  end
end

