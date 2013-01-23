require "testdo/version"
require "testdo/capture"


def test &block
  Testdo::Test.new.feed(&block).print
end

module Testdo
  class Test
    include Testdo

    CAPTURE = {
      [Fixnum, Range, String, NilClass, Regexp, TrueClass, FalseClass] => %i[== === > < =~],
      [Array] => %i[include?] }

    def initialize(capture: CAPTURE)
      @capture = capture
      @result = []
    end

    def feed &block
      results = []
      Capture(@capture) { |method,arg1,arg2,result|
        text = "#{arg1.inspect} #{method.to_s} #{arg2.inspect}" 
        results << {text: text, result: result}
      }.eval(&block)

      @result.push *results
      self
    end

    def print
      successful = @result.select { |x| x[:result] }
      failed    = @result.select { |x| !x[:result] }

      if failed.count > 0
        puts 'Failed examples:'
        failed.each { |result| puts result[:text] }
        puts "OK: #{successful.count}, failed: #{failed.count}"
      else
        puts "OK: #{successful.count}"
      end
    end
  end
end

__END__
# Class looks more flexible

def test watched=nil, &block
  watched ||= {
    [Fixnum, Range, String, NilClass, Regexp, TrueClass, FalseClass] => %i[== === > < =~],
    [Array] => %i[include?] }

  results = []
  Watcher(watched) { |method,arg1,arg2,result|
    text = "#{arg1.inspect} #{method.to_s} #{arg2.inspect}" 
    results << {text: text, result: result}
  }.eval(&block)

  successful = results.select { |x| x[:result] }
  failed    = results.select { |x| !x[:result] }

  if failed.count > 0
    puts 'Failed examples:'
    failed.each do |result| puts result[:text] end
  end
  puts "OK: #{successful.count}, failed: #{failed.count}"
end