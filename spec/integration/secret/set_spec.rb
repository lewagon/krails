RSpec.describe "`krails secret set` command", type: :cli do
  it "executes `krails secret help set` command successfully" do
    output = `krails secret help set`
    expected_output = <<~OUT
      Usage:
        krails set NAME VALUE

      Options:
        -h, [--help], [--no-help]  # Display usage information

      Set application secret in a cluster
    OUT

    expect(output).to eq(expected_output)
  end
end
