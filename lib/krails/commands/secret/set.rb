# frozen_string_literal: true

require_relative "../../command"
require "json"

module Krails
  module Commands
    class Secret
      class Set < Krails::Command
        EXEC = "kubectl"

        def initialize(name, value, options)
          @name = name
          @value = value
          @options = options
        end

        def execute(input: $stdin, output: $stdout)
          # Command logic goes here ...
          # TODO: get secret object name from config/application name
          output.puts "OK"
          return unless exec_exist?(EXEC)

          payload = {
            stringData: {
              @name => @value
            }
          }

          patch = "#{EXEC} patch secret www-secrets -p"
          command(printer: :quiet)
            .run(
              patch,
              JSON.dump(payload)
            )
        end
      end
    end
  end
end
