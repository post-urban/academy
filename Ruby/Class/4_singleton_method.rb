class C
  def c_instance_method
    @my_var = 1
  end
end

obj = C.new

def obj.obj_singleton_method  # 特異メソッドを定義
  "obj_singleton_method"
end

puts obj.obj_singleton_method # => obj_singleton_method

# singleton_classでそのオブジェクトの特異クラスを取得できる
puts obj.singleton_class.inspect  # => #<Class:#<C:0x00007fd46d884750>>

# 特異メソッド obj_singleton_method はクラスCには属さない
puts obj.class.instance_methods(false).inspect # => [:c_instance_method]

# 特異メソッド obj_singleton_method はobjの特異クラスに属する
puts obj.singleton_class.instance_methods(false).inspect # => [:obj_singleton_method]

# 特異クラスのsuperclassは、オブジェクトの参照しているクラスであるC
puts obj.singleton_class.superclass.inspect # => C
