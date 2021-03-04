# frozen_string_literal: true

require_relative "../command"

module Krails
  module Commands
    class Config < Krails::Command
      def initialize(options)
        @options = options
      end

      def execute(input: $stdin, output: $stdout)
        # Command logic goes here ...
        output.puts "OK"
        if exec_exist?("helm")
          p which("helm")
        end
      end
    end
  end
end
