require 'krails/commands/config'

RSpec.describe Krails::Commands::Config do
  it "executes `config` command successfully" do
    output = StringIO.new
    options = {}
    command = Krails::Commands::Config.new(options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
