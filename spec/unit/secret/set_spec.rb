require 'krails/commands/secret/set'

RSpec.describe Krails::Commands::Secret::Set do
  xit "executes `secret set` command successfully" do
    output = StringIO.new
    name = nil
    value = nil
    options = {}
    command = Krails::Commands::Secret::Set.new(name, value, options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
