require 'krails/commands/secret/all'

RSpec.describe Krails::Commands::Secret::All do
  it "executes `secret all` command successfully" do
    output = StringIO.new
    options = {}
    command = Krails::Commands::Secret::All.new(options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
