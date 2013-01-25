Feature: TestDO tested on ruby-2.0.0-preview2

  Scenario:
    Given a file named "file.rb" with:
      """
      require 'testdo'
      test do
        (a=BasicObject.new) === a
      end
      """  
    When I run `ruby file.rb`
    Then the output should contain "undefined method `===' for #<BasicObject"


  Scenario:
    Given a file named "file.rb" with:
      """
      require 'testdo'
      test do
        (a=BasicObject.new).__id__ === a.__id__
      end
      """  
    When I successfully run `ruby file.rb`
    Then the output should contain exactly:
      """
      OK: 1

      """      