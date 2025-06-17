module Jekyll
  module DaysToYearsMonths
    def days_to_ym(days)
      years = days / 365
      remaining_days = days % 365

      months = remaining_days / 30
      remaining_days = remaining_days % 30

      weeks = remaining_days / 7
      days = remaining_days % 7

      parts = []
      parts << "#{years} year#{'s' if years != 1}" if years > 0
      parts << "#{months} month#{'s' if months != 1}" if months > 0

      prefix = days > 0 ? "Over " : ""
      "#{prefix}#{parts.join(', ')} ago"
    end
  end
end

Liquid::Template.register_filter(Jekyll::DaysToYearsMonths)