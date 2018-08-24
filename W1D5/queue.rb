class Queue
  def initialize
    @stack_stor = []
  end

  def enqueue(el)
    @stack_stor.push(el)
  end

  def dequeue
    @stack_stor.shift
  end

  def peek
    @stack_stor.first
  end
end
