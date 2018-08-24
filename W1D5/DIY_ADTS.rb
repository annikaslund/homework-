class Stack
  def initialize
    @stack_stor = []
  end

  def push(el)
    @stack_stor << el
  end

  def pop
    @stack_stor.pop
  end

  def peek
    @stack_stor.first
  end

end
