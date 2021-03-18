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
          @app_name = config.app_name || command.run("pwd").out&.split("/")&.last
        end

        def execute(input: $stdin, output: $stdout)
          output.puts "OK"
          return unless exec_exist?(EXEC)

          payload = {
            stringData: {
              @name => @value
            }
          }

          patch = "#{EXEC} patch secret #{@app_name}-secrets -p"
          command
            .run(
              patch,
              JSON.dump(payload)
            )
        end
      end
    end
  end
end
