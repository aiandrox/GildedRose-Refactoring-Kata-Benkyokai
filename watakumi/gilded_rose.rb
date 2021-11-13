class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      QualityUpdater.new(item).update
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

class QualityUpdater
  AGED_BRIE = "Aged Brie"
  BACKSTAGE_PASSES = "Backstage passes to a TAFKAL80ETC concert"
  SULFURAS = "Sulfuras, Hand of Ragnaros"
  CONJURED = "Conjured"

  def initialize(item)
    @item = item
  end

  def  update
    case item.name
    when AGED_BRIE
      AgedBrieUpdater.new.call(item)
    when BACKSTAGE_PASSES
      BackstagePassesUpdater.new.call(item)
    when SULFURAS
      SulfurasUpdater.new.call(item)
    when CONJURED
      ConjuredUpdater.new.call(item)
    else
      DefaultUpdater.new.call(item)
    end
  end

  private
  attr_reader :item
end

class AgedBrieUpdater
  def call(item)
    if item.quality < 50
      item.quality = item.quality + 1
    end
  
    item.sell_in = item.sell_in - 1
    if item.sell_in < 0 && item.quality < 50
      item.quality = item.quality + 1
    end
  end
end

class BackstagePassesUpdater
  def call(item)
    if item.quality < 50
      item.quality = item.quality + 1
      if item.sell_in < 11
        item.quality = item.quality + 1
      end
      if item.sell_in < 6
        item.quality = item.quality + 1
      end
    end
  
    item.sell_in = item.sell_in - 1
    if item.sell_in < 0
      item.quality = item.quality - item.quality
    end
  end
end

class SulfurasUpdater
  IMMUTABLE_VALUE = 80
  def call(item)
    item.quality = IMMUTABLE_VALUE
  end
end

class DefaultUpdater
  def call(item)
    item.quality = item.quality - 1 if item.quality > 0
    item.sell_in = item.sell_in - 1

    if item.sell_in < 0 && item.quality > 0
      item.quality = item.quality - 1
    end
  end
end

class ConjuredUpdater
  def call(item)
    start_quality = item.quality
    DefaultUpdater.new.call(item)
    diff = start_quality - item.quality
    item.quality = item.quality - diff
  end
end
