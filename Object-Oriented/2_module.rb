
# 独立した最小限のクラス
class Engine
  def on
    puts "Engine on"
  end
end

# 独立した最小限のクラス
class Gear
  def change
    puts "Gear change"
  end
end

# 汎用的に使いまわせる
class Car
  def drive
    Engine.new.on
    Gear.new.change
    
    puts "Car drive"
  end
end
