require "krails/commands/secret/get"

RSpec.describe Krails::Commands::Secret::Get do
  it "executes `secret get` command successfully" do
    output = StringIO.new
    options = {}
    command = Krails::Commands::Secret::Get.new(options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
