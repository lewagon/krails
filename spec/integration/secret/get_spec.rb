RSpec.describe "`krails secret get` command", type: :cli do
  it "executes `krails secret help get` command successfully" do
    output = `krails secret help get`
    expected_output = <<-OUT
Usage:
  krails get

Options:
  -h, [--help], [--no-help]  # Display usage information

get decoded application secrets from a cluster
    OUT

    expect(output).to eq(expected_output)
  end
end
