RSpec.describe "`krails secret` command", type: :cli do
  it "executes `krails help secret` command successfully" do
    output = `krails help secret`
    expected_output = <<-OUT
Commands:
    OUT

    expect(output).to eq(expected_output)
  end
end
