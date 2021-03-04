# frozen_string_literal: true

require_relative "../../command"

module Krails
  module Commands
    class Secret
      class Get < Krails::Command
        def initialize(name, options)
          @options = options
          @name = name
        end

        def execute(input: $stdin, output: $stdout)
          # Command logic goes here ...
          # TODO: get secret object name from config/application name
          output.puts "OK"
          exec = "kubectl"
          if exec_exist?(exec) && exec_exist?("base64")
            command(printer: :quiet)
              .run("#{exec} get secret www-secrets -o jsonpath='{.data.#{@name}}' | base64 --decode")
          end
        end
      end
    end
  end
end
