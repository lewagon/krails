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

        def execute(input: $stdin, output: $stdout)
          unless exec_exist?(EXEC) && exec_exist?("base64")
            prompt.error("Missing executable")
            raise Thor::Error, "command failed"
          end
          @app_name = config.app_name || command.run("pwd").out&.split("/")&.last
          begin
            command
              .run(
                <<~TXT
                  #{EXEC} get secret #{@app_name}-secrets \
                  -o go-template='{{ range $k, $v := .data }}{{ $k }}={{ $v | base64decode}}\n{{end}}'
                TXT
              ) do |_, err|
                output << "[#{EXEC}] #{err}" if err
              end
          rescue TTY::Command::ExitError
            warn_app_name
          end
        end

        private

        def warn_app_name
          # QUESTION: or logger.warn?
          prompt.warn(
            "You might want to check the value of app_name in your configuration\n" \
            "It is currently: #{config.app_name.inspect}\n" \
            "If this value is nil, krails infers app name from the name of the current folder\n" \
            "Current app name is inferred to be: #{@app_name}"
          )
        end
      end
    end
  end
end
