# frozen_string_literal: true

require "thor"

module Krails
  module Commands
    class Secret < Thor
      namespace :secret

      desc 'set NAME VALUE', 'Set application secret in a cluster'
      method_option :help, aliases: '-h', type: :boolean,
                           desc: 'Display usage information'
      def set(name, value)
        if options[:help]
          invoke :help, ['set']
        else
          require_relative 'secret/set'
          Krails::Commands::Secret::Set.new(name, value, options).execute
        end
      end

      desc 'all', 'Get all the application secrets from a cluster'
      method_option :help, aliases: '-h', type: :boolean,
                           desc: 'Display usage information'
      def all(*)
        if options[:help]
          invoke :help, ['all']
        else
          require_relative 'secret/all'
          Krails::Commands::Secret::All.new(options).execute
        end
      end

      desc "get NAME", "get decoded application secrets from a cluster"
      method_option :help, aliases: "-h", type: :boolean,
                           desc: "Display usage information"
      def get(name)
        if options[:help]
          invoke :help, ["get"]
        else
          require_relative "secret/get"
          Krails::Commands::Secret::Get.new(name, options).execute
        end
      end
    end
  end
end
