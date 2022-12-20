class ClosedRange
  def initialize(initial_num, second_num)
    if initial_num > second_num
      @lower_num = second_num
      @upper_num = initial_num
    else
      @lower_num = initial_num
      @upper_num = second_num
    end
  end
end
