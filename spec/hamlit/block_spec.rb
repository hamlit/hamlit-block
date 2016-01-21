require 'spec_helper'

describe Hamlit::Block do
  def assert_render(html, haml)
    expect(eval Hamlit::Engine.new.call(haml)).to eq(html)
  end

  describe 'silent script' do
    it 'does not render contents inside block' do
      assert_render("", <<-HAML.unindent)
        - 3.times do |i|
          = i
      HAML
    end

    specify 'block script contents are available via `yield`' do
      assert_render(<<-HTML.unindent, <<-'HAML'.unindent)
        hey
        <form>
        <span>
        hello world
        </span>
        </form>
      HTML
        - def form; "<form>\n#{yield}</form>"; end
        - result = form do
          %span
            hello world
        hey
        = result
      HAML
    end
  end

  describe 'script' do
    it 'does not escape script by default' do
      assert_render(<<-HTML.unindent, <<-HAML.unindent)
        <script>
      HTML
        = "<script>"
      HAML
    end

    it 'does not render contents inside block' do
      assert_render("3", <<-HAML.unindent)
        = 3.times do |i|
          = i
      HAML
    end

    specify 'script contents are available via `yield`' do
      assert_render(<<-HTML.unindent.rstrip, <<-'HAML'.unindent)
        <form>
        <span>
        hello world
        </span>
        </form>
      HTML
        - def form; "<form>\n#{yield}</form>"; end
        = form do
          %span
            hello world
      HAML
    end
  end
end
