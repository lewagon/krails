# frozen_string_literal: true

require "thor"
module Krails
  class << self
    def config
      @config ||= begin
        KrailsConfig.new
      end
    end

    def configure
      yield(config) if block_given?
    end
  end

  # Handle the application command line parsing
  # and the dispatch to various command objects
  #
  # @api public
  class CLI < Thor
    # Error raised by this runner
    Error = Class.new(StandardError)

    desc "version", "krails version"
    def version
      require_relative "version"
      puts "v#{Krails::VERSION}"
    end
    map %w[--version -v] => :version

    require_relative "commands/secret"
    register Krails::Commands::Secret, "secret", "secret [all|get|set]", "Operate on application secrets in a cluster"

    desc "config", "Command description..."
    method_option :help, aliases: "-h", type: :boolean,
                         desc: "Display usage information"
    def config(*)
      if options[:help]
        invoke :help, ["config"]
      else
        require_relative "commands/config"
        Krails::Commands::Config.new(options).execute
      end
    end
  end
end
