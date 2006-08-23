	#LocalizationSimplified
	# Really simple localization for Rails
	# By Jesper Rønn-Jensen ( http://justaddwater.dk/ )
	# Plugin available at http://visitjesper.homeip.net/plugins/ 
	# IMPORTANT: Plugin directory likely to move to more appropriate location soon


module ActiveRecord #:nodoc:
  class Errors
		#includeLocalizationSimplified
		#Error messages modified in lang file
		@@default_error_messages.update(LocalizationSimplified::ActiveRecord::ErrorMessages)
  end
end

module ActionView
  module Helpers

		#Modifie ActiveRecord to use error message headers (text from lang-file)
    module ActiveRecordHelper
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
      def distance_of_time_in_words(from_time, to_time = 0, include_seconds = false)
        from_time = from_time.to_time if from_time.respond_to?(:to_time)
        to_time = to_time.to_time if to_time.respond_to?(:to_time)
        distance_in_minutes = (((to_time - from_time).abs)/60).round
        distance_in_seconds = ((to_time - from_time).abs).round
				
		  	#First, I invent a variable (makes it easier for future i10n)
    		messages = LocalizationSimplified::DateHelper::Texts #localized
        case distance_in_minutes
          when 0..1
            return (distance_in_minutes==0) ? 'less than a minute' : '1 minute' unless include_seconds
            case distance_in_seconds
              when 0..5   then format( messages[:less_than_x_seconds], 5 )
              when 6..10  then format( messages[:less_than_x_seconds], 10 )
              when 11..20 then format( messages[:less_than_x_seconds], 20 )
              when 21..40 then messages[:half_a_minute]
              when 41..59 then messages[:less_than_a_minute]
              else             messages[:one_minute]
            end
                                
          when 2..45      then format(messages[:x_minutes], distance_in_minutes)
          when 46..90     then messages[:one_hour]
          when 90..1440   then format( messages[:x_hours], (distance_in_minutes.to_f / 60.0).round )
          when 1441..2880 then messages[:one_day]
          else             			format( messages[:x_days], (distance_in_minutes / 1440).round )
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
			def number_to_currency(number, options = {})
				
				#blend default options with sent through options
				options.reverse_merge!(LocalizationSimplified::NumberHelper::CurrencyOptions)
				orig_number_to_currency(number, options)
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
  DAYNAMES           = LocalizationSimplified::DateHelper::Daynames
  ABBR_DAYNAMES      = LocalizationSimplified::DateHelper::AbbrDaynames
end
class Time 
  #FIXME as these are defined as Ruby constants, they can't be overwritten
  RFC2822_DAY_NAME   = LocalizationSimplified::DateHelper::AbbrDaynames
  RFC2822_MONTH_NAME = LocalizationSimplified::DateHelper::AbbrMonthnames
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
    #Response header below not necessary in new versions of Rails (thanks Jeroen Houben)
    #@response.headers["Content-Type"] = "text/html; charset=utf-8"

    # Set connection charset. MySQL 4.0 doesn't support this so it
    # will throw an error, MySQL 4.1 needs this
    suppress(ActiveRecord::StatementInvalid) do
      ActiveRecord::Base.connection.execute 'SET NAMES UTF8'
    end
  end	
end

