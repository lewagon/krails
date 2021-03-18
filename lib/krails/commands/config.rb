# frozen_string_literal: true

require "pp"
require_relative "../command"

module Krails
  module Commands
    class Config < Krails::Command
      def initialize(options)
        @options = options
      end

      def execute(input: $stdin, output: $stdout)
        prompt.say(Krails.config.pretty_inspect)
      end
    end
  end
end
