puts "str" + "ing"  # => "string"
puts "str".+("ing") # => "string"


puts "================ Original Method ================"
class String
  def -(other)
    self.delete(other)  # otherで指定された文字列を削除する
  end
end

puts "string" - "ing"  # => "str"
