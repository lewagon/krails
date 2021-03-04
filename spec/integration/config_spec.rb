RSpec.describe "`krails config` command", type: :cli do
  it "executes `krails help config` command successfully" do
    output = `krails help config`
    expected_output = <<~OUT
      Usage:
        krails config

      Options:
        -h, [--help], [--no-help]  # Display usage information

      Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
