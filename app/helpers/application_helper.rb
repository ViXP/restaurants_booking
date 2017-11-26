module ApplicationHelper
  # Converts duration to pretty time string format
  def pretty_time duration = 0.seconds
    string = Time.at(duration).utc.strftime("%H:%M")
    if duration > 24.hours
      string << ' ' + I18n.t('application_helper.pretty_time.of_next_day')
    end
    string
  end

  # Creates the time select box, including the next day time
  def time_selector context, attribute
    options = []
    (0..36).each do |h|
      marker = ''
      if h < 10
        h_w = "0#{h}"
      elsif h > 23
        h_w = (h - 24 < 10) ? "0#{h - 24}" : "#{h - 24}"
        marker = ' ' + I18n.t('application_helper.time_selector.of_n_d')
      else
        h_w = "#{h}"
      end
      [0, 30].each do |m|
        m_w = m < 10 ? "0#{m}" : "#{m}"
        options << [%Q(#{h_w}:#{m_w}#{marker}), h.hours + m.minutes]
      end
    end
    context.select(attribute, options_for_select(options))
  end
end
