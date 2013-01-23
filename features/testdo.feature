Feature: TestDO

  Scenario:
    Given a file named "file.rb" with:
      """
      require 'testdo'
      test do
        1 == 1
        2 == 2
        /\d/ =~ '9'
      end
      """  
    When I successfully run `ruby -S file.rb`
