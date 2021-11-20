# frozen_string_literal: true

class GildedRose
  def initialize(items)
    @items = items.map do |item|
      ItemWrapper.wrap(item)
    end
  end

  def update_quality
    @items.each do |item|
      if (item.name != 'Aged Brie') && (item.name != 'Backstage passes to a TAFKAL80ETC concert')
        item.quality = item.quality - 1 if item.quality.positive? && (item.name != 'Sulfuras, Hand of Ragnaros')
      elsif item.quality < 50
        item.quality = item.quality + 1
        if item.name == 'Backstage passes to a TAFKAL80ETC concert'
          item.quality = item.quality + 1 if item.sell_in < (11) && (item.quality < 50)
          item.quality = item.quality + 1 if item.sell_in < (6) && (item.quality < 50)
        end
      end
      item.sell_in = item.sell_in - 1 if item.name != 'Sulfuras, Hand of Ragnaros'
      if item.sell_in.negative?
        if item.name != 'Aged Brie'
          if item.name != 'Backstage passes to a TAFKAL80ETC concert'
            item.quality = item.quality - 1 if item.quality.positive? && (item.name != 'Sulfuras, Hand of Ragnaros')
          else
            item.quality = item.quality - item.quality
          end
        elsif item.quality < 50
          item.quality = item.quality + 1
        end
      end
    end
  end
end

# :nocov:
class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
# :nocov:

class ItemWrapper
  extend Forwardable

  delegate %i[name sell_in quality sell_in= quality=] => :@item

  def self.wrap(item)
    case item.name
    when 'Aged Brie' then AgedBrie.new(item)
    when 'Backstage passes to a TAFKAL80ETC concert' then BackstagePasses.new(item)
    when 'Sulfuras, Hand of Ragnaros' then Sulfuras.new(item)
    else Other.new(item)
    end
  end

  def initialize(item)
    @item = item
  end
end

class AgedBrie < ItemWrapper
end

class BackstagePasses < ItemWrapper
end

class Sulfuras < ItemWrapper
end

class Other < ItemWrapper
end
