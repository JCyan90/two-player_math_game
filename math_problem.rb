class Math_problem
  attr_reader :solution

  # Create two random numbers and store the solution
  def initialize
    @n1 = rand(1..20)
    @n2 = rand(1..20)
    @solution = @n1 + @n2
  end

  def ask
    puts "What's #{@n1} + #{@n2}?"
  end
  
  # Check the answer with the solution
  def check_answer(answer)
    answer == @solution
  end
  
end