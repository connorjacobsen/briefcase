require File.expand_path '../../../spec_helper.rb', __FILE__
require 'lib/summary'
require 'pry'

RSpec.describe Summary do
  let(:filename) { File.expand_path('spec/support/files/test_1.html') }
  let(:html) { File.open(filename, 'r').read }
  let(:elements) do
    { 'html' => 1, 'head' => 1, 'title' => 1, 'body' => 1, 'h1' => 1, 'p' => 2 }
  end

  subject { Summary.new(html) }

  it '#elements' do
    expect(subject.elements).to eql elements
  end
end
