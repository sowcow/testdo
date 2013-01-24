module Testdo

  # used to outflank refinement
  class Unwrap
    def initialize obj; @obj = obj end
    def send *a,&b
      obj.send *a,&b
    end
    private; attr_reader :obj
    def self.[] *a; new *a end
  end

  ##############################################
  # only for methods with one param right now! #
  ##############################################
  # returns module with refinements that inform callback when specified messages sent to specified classes
  def CaptureModule(classes_methods, &callback)
    Module.new do
      classes_methods.each do |classes,method_names|
        [*classes].each do |klass|
          refine klass do
            [*method_names].each do |name|
              define_method name do |*arguments,&block|
                Unwrap[self].send(__method__,*arguments,&block).tap { |result| callback.call self,__method__,arguments,block,result }
              end
            end
          end
        end
      end
    end
  end

  # returns class that implement .eval(&block) and send all specified stuff to callback
  def Capture classes_methods, &callback
    Class.new do
      extend Testdo
      using CaptureModule(classes_methods, &callback)

      def self.eval &block;
        class_eval &block
      end
    end
  end  
end



if __FILE__== $0 # kind of usage
  include Testdo

  # CaptureModule
  class Any
    using CaptureModule(String => :+, Array => :all?) { |receiver,msg,args,block,result| @got = result } # don't try do-end block here

    def self.eval &block
      class_eval &block
      self
    end
    class << self; attr_reader :got end
  end

  raise unless Any.eval { '1'+'1';nil }.got == '11'
  raise unless Any.eval { '2'+'2';nil }.got == '22'
  raise unless Any.eval { [1,2].all?{true} }.got == true
  raise unless Any.eval { [1,2].all?{false} }.got == false

  # Capture
  got = nil
  Capture([String,Fixnum] => [:+, :-]) { |receiver,msg,args,block,result| got = result }.eval { '3'+'3';nil }
  raise unless got == '33'
  Capture([String,Fixnum] => [:+, :-]) { |receiver,msg,args,block,result| got = result }.eval { 3+3;nil }
  raise unless got == 6


  # sort of no footprints
  got = nil
  Object.class_eval{ 'any'+'any'; 0 + 0 }
  instance_eval{ 'any'+'any'; 0 + 0 }
  raise unless got == nil

  puts 'OK'
end