# frozen_string_literal: true

require_relative "../../command"

module Krails
  module Commands
    class Secret
      class All < Krails::Command
        def initialize(options)
          @options = options
        end

        def execute(input: $stdin, output: $stdout)
          output.puts "OK"
          exec = "kubectl"
          if exec_exist?(exec) && exec_exist?("base64")
            command(printer: :quiet)
              .run(
                <<~TXT
                  #{exec} get secret learn-secrets \
                  -o go-template='{{ range $k, $v := .data }}{{ $k }}={{ $v | base64decode}}\n{{end}}'
                TXT
              )
          end
        end
      end
    end
  end
end
