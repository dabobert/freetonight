class Array
  def intersperse(separator)
    interspersed = []
    self.each_with_index do |v,i|
      interspersed << v
      interspersed<< separator if i != self.size - 1
    end
    interspersed
  end
end