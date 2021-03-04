# frozen_string_literal: true

require_relative "../../command"

module Krails
  module Commands
    class Secret
      class All < Krails::Command
        EXEC = "kubectl"

        def initialize(options)
          @options = options
        end

        # TODO: Handle errors from k8s API server

        def execute(input: $stdin, output: $stdout)
          # TODO: get secret object name from config/application name
          unless exec_exist?(EXEC) && exec_exist?("base64")
            return # TODO: warn about missing executables
          end
          app_name = config.app_name || command.run("pwd").out&.split("/")&.last
          command
            .run(
              <<~TXT
                #{EXEC} get secret #{app_name}-secrets \
                -o go-template='{{ range $k, $v := .data }}{{ $k }}={{ $v | base64decode}}\n{{end}}'
              TXT
            )
        rescue TTY::Command::ExitError
          # QUESTION: or logger.warn?
          prompt.warn(
            "You might want to check the value of app_name in your configuration\n" \
            "It is currently: #{config.app_name.inspect}\n" \
            "If this value is nil, krails infers app name from the name of the current folder\n" \
            "Current app name is inferred to be: #{app_name}"
          )
        end
      end
    end
  end
end
