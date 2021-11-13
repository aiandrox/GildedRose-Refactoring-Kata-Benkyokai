# frozen_string_literal: true

require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  describe '#update_quality' do
    def execute(item)
      GildedRose.new([item]).update_quality
    end

    it 'name は変わらない' do
      name = 'foo'
      item = Item.new(name, 10, 10)
      execute(item)
      expect(item.name).to eq name
    end

    it 'sell_in が 1 下がる' do
      sell_in = 10
      item = Item.new('foo', sell_in, 10)
      execute(item)
      expect(item.sell_in).to eq sell_in - 1

      sell_in = 10
      item = Item.new('foo', sell_in, 60)
      execute(item)
      expect(item.sell_in).to eq sell_in - 1
    end

    it 'quality が 1 下がる' do
      quality = 10
      item = Item.new('foo', 10, quality)
      execute(item)
      expect(item.quality).to eq quality - 1
    end

    it 'sell_in が 0 以下のとき quality は 2 小さくなる' do
      quality = 10
      item = Item.new('foo', 0, quality)
      execute(item)
      expect(item.quality).to eq quality - 2

      quality = 10
      item = Item.new('foo', -1, quality)
      execute(item)
      expect(item.quality).to eq quality - 2
    end

    it 'quality はマイナスにはならない' do
      min_quality = 0
      item = Item.new('foo', 0, min_quality)
      execute(item)
      expect(item.quality).to eq min_quality
    end

    context 'name が "Aged Brie" のとき' do
      it 'quality は 1 上がる' do
        quality = 10
        item = Item.new('Aged Brie', 10, quality)
        execute(item)
        expect(item.quality).to eq quality + 1
      end

      it 'quality は 50 より上にならない' do
        max_quality = 50
        item = Item.new('Aged Brie', 10, max_quality)
        execute(item)
        expect(item.quality).to eq max_quality
      end
    end

    context 'name が　"Sulfuras, Hand of Ragnaros" のとき' do
      it 'sell_in が 0 である（販売できない）' do
        item = Item.new('Sulfuras, Hand of Ragnaros', 0, 80)
        execute(item)
        expect(item.sell_in).to eq 0
      end

      it 'quality が 80 のままである' do
        item = Item.new('Sulfuras, Hand of Ragnaros', 0, 80)
        execute(item)
        expect(item.quality).to eq 80
      end
    end

    context 'name が "Backstage passes to a TAFKAL80ETC concert" のとき' do
      it 'sell_in が 11 日以上のときは quality が 1 上がる' do
        quality = 10
        item = Item.new('Backstage passes to a TAFKAL80ETC concert', 11, quality)
        execute(item)
        expect(item.quality).to eq quality + 1
      end

      it 'sell_in が 6 〜 10 日のときは quality が 2 上がる' do
        quality = 10
        item = Item.new('Backstage passes to a TAFKAL80ETC concert', 10, quality)
        execute(item)
        expect(item.quality).to eq quality + 2

        quality = 10
        item = Item.new('Backstage passes to a TAFKAL80ETC concert', 6, quality)
        execute(item)
        expect(item.quality).to eq quality + 2
      end

      it 'sell_in が 1 〜 5 日以下のときは quality が 3 上がる' do
        quality = 10
        item = Item.new('Backstage passes to a TAFKAL80ETC concert', 5, quality)
        execute(item)
        expect(item.quality).to eq quality + 3

        quality = 10
        item = Item.new('Backstage passes to a TAFKAL80ETC concert', 1, quality)
        execute(item)
        expect(item.quality).to eq quality + 3
      end

      it 'sell_in が 0 以下のとき quality が 0 になる' do
        quality = 10
        item = Item.new('Backstage passes to a TAFKAL80ETC concert', 0, quality)
        execute(item)
        expect(item.quality).to eq 0
      end

      it 'quality は 50 より上にならない' do
        max_quality = 50
        item = Item.new('Backstage passes to a TAFKAL80ETC concert', 10, max_quality)
        execute(item)
        expect(item.quality).to eq max_quality
      end
    end

    context 'name が "Conjured Mana Cake" のとき' do
      it 'quality が 2 下がる' do
        quality = 10
        item = Item.new('Conjured Mana Cake', 10, quality)
        execute(item)
        expect(item.quality).to eq quality - 2
      end

      it 'sell_in が 0 以下のとき quality は 4 小さくなる' do
        quality = 10
        item = Item.new('Conjured Mana Cake', 0, quality)
        execute(item)
        expect(item.quality).to eq quality - 4

        quality = 10
        item = Item.new('Conjured Mana Cake', -1, quality)
        execute(item)
        expect(item.quality).to eq quality - 4
      end

      it 'quality はマイナスにはならない' do
        min_quality = 0
        item = Item.new('Conjured Mana Cake', 0, min_quality)
        execute(item)
        expect(item.quality).to eq min_quality
      end
    end
  end
end
