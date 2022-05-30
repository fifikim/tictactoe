# frozen_string_literal: true

require 'console'
require 'stringio'

describe Console do
  before do
    @console = Console.new
    $stdout = StringIO.new
  end

  it 'should take in a message and print it to the console' do
    @console.output('A console instance printed this test message')
    output = $stdout.string.split("\n")

    expect(output).to include('A console instance printed this test message')
  end
end
