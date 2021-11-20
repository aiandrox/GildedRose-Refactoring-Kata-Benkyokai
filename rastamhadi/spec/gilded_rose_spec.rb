# frozen_string_literal: true

require 'simplecov'
require 'rspec-parameterized'

SimpleCov.start do
  enable_coverage :branch
  primary_coverage :branch
  refuse_coverage_drop
  track_files 'gilded_rose.rb'
end

require File.join(File.dirname(__FILE__), '..', 'gilded_rose')

describe GildedRose do
  where :name, :old_sell_in, :old_quality, :new_sell_in, :new_quality do
    [
      ['Aged Brie', 11, 50, 10, 50],
      ['Aged Brie', 11, 49, 10, 50],
      ['Aged Brie', 11, 1, 10, 2],
      ['Aged Brie', 11, 0, 10, 1],
      ['Aged Brie', 10, 50, 9, 50],
      ['Aged Brie', 10, 49, 9, 50],
      ['Aged Brie', 10, 1, 9, 2],
      ['Aged Brie', 10, 0, 9, 1],
      ['Aged Brie', 6, 50, 5, 50],
      ['Aged Brie', 6, 49, 5, 50],
      ['Aged Brie', 6, 1, 5, 2],
      ['Aged Brie', 6, 0, 5, 1],
      ['Aged Brie', 5, 50, 4, 50],
      ['Aged Brie', 5, 49, 4, 50],
      ['Aged Brie', 5, 1, 4, 2],
      ['Aged Brie', 5, 0, 4, 1],
      ['Aged Brie', 1, 50, 0, 50],
      ['Aged Brie', 1, 49, 0, 50],
      ['Aged Brie', 1, 1, 0, 2],
      ['Aged Brie', 1, 0, 0, 1],
      ['Aged Brie', 0, 50, -1, 50],
      ['Aged Brie', 0, 49, -1, 50],
      ['Aged Brie', 0, 1, -1, 3],
      ['Aged Brie', 0, 0, -1, 2],
      ['Aged Brie', -1, 50, -2, 50],
      ['Aged Brie', -1, 49, -2, 50],
      ['Aged Brie', -1, 1, -2, 3],
      ['Aged Brie', -1, 0, -2, 2],
      ['Backstage passes to a TAFKAL80ETC concert', 11, 50, 10, 50],
      ['Backstage passes to a TAFKAL80ETC concert', 11, 49, 10, 50],
      ['Backstage passes to a TAFKAL80ETC concert', 11, 1, 10, 2],
      ['Backstage passes to a TAFKAL80ETC concert', 11, 0, 10, 1],
      ['Backstage passes to a TAFKAL80ETC concert', 10, 50, 9, 50],
      ['Backstage passes to a TAFKAL80ETC concert', 10, 49, 9, 50],
      ['Backstage passes to a TAFKAL80ETC concert', 10, 1, 9, 3],
      ['Backstage passes to a TAFKAL80ETC concert', 10, 0, 9, 2],
      ['Backstage passes to a TAFKAL80ETC concert', 6, 50, 5, 50],
      ['Backstage passes to a TAFKAL80ETC concert', 6, 49, 5, 50],
      ['Backstage passes to a TAFKAL80ETC concert', 6, 1, 5, 3],
      ['Backstage passes to a TAFKAL80ETC concert', 6, 0, 5, 2],
      ['Backstage passes to a TAFKAL80ETC concert', 5, 50, 4, 50],
      ['Backstage passes to a TAFKAL80ETC concert', 5, 49, 4, 50],
      ['Backstage passes to a TAFKAL80ETC concert', 5, 1, 4, 4],
      ['Backstage passes to a TAFKAL80ETC concert', 5, 0, 4, 3],
      ['Backstage passes to a TAFKAL80ETC concert', 1, 50, 0, 50],
      ['Backstage passes to a TAFKAL80ETC concert', 1, 49, 0, 50],
      ['Backstage passes to a TAFKAL80ETC concert', 1, 1, 0, 4],
      ['Backstage passes to a TAFKAL80ETC concert', 1, 0, 0, 3],
      ['Backstage passes to a TAFKAL80ETC concert', 0, 50, -1, 0],
      ['Backstage passes to a TAFKAL80ETC concert', 0, 49, -1, 0],
      ['Backstage passes to a TAFKAL80ETC concert', 0, 1, -1, 0],
      ['Backstage passes to a TAFKAL80ETC concert', 0, 0, -1, 0],
      ['Backstage passes to a TAFKAL80ETC concert', -1, 50, -2, 0],
      ['Backstage passes to a TAFKAL80ETC concert', -1, 49, -2, 0],
      ['Backstage passes to a TAFKAL80ETC concert', -1, 1, -2, 0],
      ['Backstage passes to a TAFKAL80ETC concert', -1, 0, -2, 0],
      ['Sulfuras, Hand of Ragnaros', 11, 50, 11, 50],
      ['Sulfuras, Hand of Ragnaros', 11, 49, 11, 49],
      ['Sulfuras, Hand of Ragnaros', 11, 1, 11, 1],
      ['Sulfuras, Hand of Ragnaros', 11, 0, 11, 0],
      ['Sulfuras, Hand of Ragnaros', 10, 50, 10, 50],
      ['Sulfuras, Hand of Ragnaros', 10, 49, 10, 49],
      ['Sulfuras, Hand of Ragnaros', 10, 1, 10, 1],
      ['Sulfuras, Hand of Ragnaros', 10, 0, 10, 0],
      ['Sulfuras, Hand of Ragnaros', 6, 50, 6, 50],
      ['Sulfuras, Hand of Ragnaros', 6, 49, 6, 49],
      ['Sulfuras, Hand of Ragnaros', 6, 1, 6, 1],
      ['Sulfuras, Hand of Ragnaros', 6, 0, 6, 0],
      ['Sulfuras, Hand of Ragnaros', 5, 50, 5, 50],
      ['Sulfuras, Hand of Ragnaros', 5, 49, 5, 49],
      ['Sulfuras, Hand of Ragnaros', 5, 1, 5, 1],
      ['Sulfuras, Hand of Ragnaros', 5, 0, 5, 0],
      ['Sulfuras, Hand of Ragnaros', 1, 50, 1, 50],
      ['Sulfuras, Hand of Ragnaros', 1, 49, 1, 49],
      ['Sulfuras, Hand of Ragnaros', 1, 1, 1, 1],
      ['Sulfuras, Hand of Ragnaros', 1, 0, 1, 0],
      ['Sulfuras, Hand of Ragnaros', 0, 50, 0, 50],
      ['Sulfuras, Hand of Ragnaros', 0, 49, 0, 49],
      ['Sulfuras, Hand of Ragnaros', 0, 1, 0, 1],
      ['Sulfuras, Hand of Ragnaros', 0, 0, 0, 0],
      ['Sulfuras, Hand of Ragnaros', -1, 50, -1, 50],
      ['Sulfuras, Hand of Ragnaros', -1, 49, -1, 49],
      ['Sulfuras, Hand of Ragnaros', -1, 1, -1, 1],
      ['Sulfuras, Hand of Ragnaros', -1, 0, -1, 0],
      ['Other', 11, 50, 10, 49],
      ['Other', 11, 49, 10, 48],
      ['Other', 11, 1, 10, 0],
      ['Other', 11, 0, 10, 0],
      ['Other', 10, 50, 9, 49],
      ['Other', 10, 49, 9, 48],
      ['Other', 10, 1, 9, 0],
      ['Other', 10, 0, 9, 0],
      ['Other', 6, 50, 5, 49],
      ['Other', 6, 49, 5, 48],
      ['Other', 6, 1, 5, 0],
      ['Other', 6, 0, 5, 0],
      ['Other', 5, 50, 4, 49],
      ['Other', 5, 49, 4, 48],
      ['Other', 5, 1, 4, 0],
      ['Other', 5, 0, 4, 0],
      ['Other', 1, 50, 0, 49],
      ['Other', 1, 49, 0, 48],
      ['Other', 1, 1, 0, 0],
      ['Other', 1, 0, 0, 0],
      ['Other', 0, 50, -1, 48],
      ['Other', 0, 49, -1, 47],
      ['Other', 0, 1, -1, 0],
      ['Other', 0, 0, -1, 0],
      ['Other', -1, 50, -2, 48],
      ['Other', -1, 49, -2, 47],
      ['Other', -1, 1, -2, 0],
      ['Other', -1, 0, -2, 0]
    ]
  end

  with_them do
    specify do
      item = Item.new(name, old_sell_in, old_quality)

      GildedRose.new([item]).update_quality

      expect(item.sell_in).to eq new_sell_in
      expect(item.quality).to eq new_quality
    end
  end
end
