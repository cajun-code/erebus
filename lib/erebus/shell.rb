require 'thor/shell/basic'

module Erebus
  class Shell < Thor::Shell::Basic
    # Say a status with the given color and appends the message. Since this
    # method is used frequently by actions, it allows nil or false to be given
    # in log_status, avoiding the message from being shown. If a Symbol is
    # given in log_status, it's used as the color.
    #
    def say_status(status, message, log_status=true)
      return if quiet? || log_status == false
      spaces = "  " * (padding + 1)
      color  = log_status.is_a?(Symbol) ? log_status : :green

      status = status.to_s.rjust(12)
      status = set_color status, color, true if color

      stdout.puts "#{status}#{spaces}#{message}"
      stdout.flush
    end
    
    
  end
end