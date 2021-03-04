RSpec.describe "`krails secret all` command", type: :cli do
  it "executes `krails secret help all` command successfully" do
    output = `krails secret help all`
    expected_output = <<-OUT
Usage:
  krails all

Options:
  -h, [--help], [--no-help]  # Display usage information

Get all the application secrets from a cluster
    OUT

    expect(output).to eq(expected_output)
  end
end
