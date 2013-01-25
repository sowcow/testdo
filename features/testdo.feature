Feature: TestDO tested on ruby-2.0.0-preview2

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
        a = %w[a b]
        a.equal? a
        {a: 1} == {a: 1}
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
        [*1..10].select { |x| x > 5 } == []
        # dont use > < as expectations
        # 1 > 5
        # 2 > 5
        # 3 > 5
        # 4 > 5
        # 5 > 5
      end
      """  
    When I successfully run `ruby file.rb`
    Then the output should contain exactly:
      """
      Failed examples:
      [6, 7, 8, 9, 10] == []
      OK: 0, failed: 1

      """  