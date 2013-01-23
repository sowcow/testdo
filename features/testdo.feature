Feature: TestDO

  Scenario:
    Given a file named "file.rb" with:
      """
      require 'testdo'
      test do
        1 == 1
        2 == 2
        /\d/ === '9'
      end
      """  
    When I successfully run `ruby -S file.rb`
    Then the output should contain exactly:
      """
      OK: 3

      """

  Scenario:
    Given a file named "file.rb" with:
      """
      require 'testdo'
      test do
        1 == 2
        2 == 3
        %w[a b].include? 'c'
      end
      """  
    When I successfully run `ruby -S file.rb`
    Then the output should contain exactly:
      """
      Failed examples:
      1 == 2
      2 == 3
      ["a", "b"] include? "c"
      OK: 0, failed: 3

      """