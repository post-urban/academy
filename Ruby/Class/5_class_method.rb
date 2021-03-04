class C
  def self.c_class_method  # クラスメソッド
    "c_class_method"
  end
end

puts C.c_class_method  # => c_class_method

# クラスメソッドはCの特異クラスに属している
puts C.singleton_class.instance_methods(false).inspect  # => [:c_class_method]
