require 'spec_helper'

describe Hamlit::Block do
  def assert_render(html, haml)
    expect(eval Hamlit::Engine.new.call(haml)).to eq(html)
  end

  describe 'silent script' do
    it 'works normally' do
      assert_render(<<-HTML.unindent, <<-HAML.unindent)
        0
        1
        2
      HTML
        - 3.times do |i|
          = i
      HAML
    end
  end
end
