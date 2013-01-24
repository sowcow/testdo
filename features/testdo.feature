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
    When I successfully run `ruby file.rb`
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
    When I successfully run `ruby file.rb`
    Then the output should contain exactly:
      """
      Failed examples:
      1 == 2
      2 == 3
      ["a", "b"] include? "c"
      OK: 0, failed: 3

      """


  Scenario:
    Given a file named "file.rb" with:
      """
      require 'testdo'
      test do
        %w[a b].all? { |x|x.is_a? String }
      end
      """  
    When I successfully run `ruby file.rb`
    Then the output should contain exactly:
      """
      OK: 1

      """      


  Scenario:
    Given a file named "file.rb" with:
      """
      require 'testdo'
      test do
        %w[a b].all? { false }
      end
      """  
    When I successfully run `ruby file.rb`
    Then the output should contain exactly:
      """
      Failed examples:
      ["a", "b"] all? 
      OK: 0, failed: 1

      """        

  Scenario:
    Given a file named "file.rb" with:
      """
      require 'testdo'
      test do
        %w[a b] == %w[a b]
      end
      """  
    When I successfully run `ruby file.rb`
    Then the output should contain exactly:
      """
      OK: 1

      """         