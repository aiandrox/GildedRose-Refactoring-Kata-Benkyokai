require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  describe "#update_quality" do
    context "default" do
      let(:name) { "foo" }
      it "名前は変更されない" do
        items = [Item.new(name, 0, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].name).to eq "foo"
      end

      it "quality を 1 下げる" do
        items = [Item.new(name, 0, 1)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 0
      end

      it "sell_in を 1 下げる" do
        items = [Item.new(name, 1, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 0
      end

      it "quality は 0 より下がらない" do
        items = [Item.new(name, 0, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 0
      end
    end

    context "sell_in が 0 の場合" do
      it "quality を 2 下げる" do
        items = [Item.new("foo", 0, 2)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 0
      end
    end

    context "name = Aged Brie" do
      let(:name) { "Aged Brie" }

      context "sell_in が 0" do
        let(:sell_in) { 0 }

        it "quality を 2 あげる" do
          items = [Item.new(name, sell_in, 0)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 2
        end
      end

      context "sell_in が 0 ではない" do
        let(:sell_in) { 1 }

        it "quality を 1 あげる" do
          items = [Item.new(name, sell_in, 0)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 1
        end
      end

      it "quality は 50以上にはならない" do
        items = [Item.new(name, 0, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 50
      end
    end

    context "name = Sulfuras, Hand of Ragnaros" do
      let(:item) { Item.new("Sulfuras, Hand of Ragnaros", 10, 80)}
      it "sell_in は さがらない" do
        items = [item]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 10
      end

      it "quality は 変わらない" do
        items = [item]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 80
      end
    end

    context "name = Backstage passes to a TAFKAL80ETC concert" do
      let(:name) { "Backstage passes to a TAFKAL80ETC concert" }

      context "sell_in = 0 " do
        let(:sell_in) { 0 }
        it "quality が 0 になる" do
          items = [Item.new(name, sell_in, 10)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 0
        end
      end

      context "sell_in <= 5" do
        let(:sell_in) { 5 }
        it "quality が 3 あがる" do
          items = [Item.new(name, sell_in, 0)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 3
        end
      end

      context "sell_in > 5, sell_in <= 10" do
        it "quality が 2 あがる" do
          items = [Item.new(name, 6, 0), Item.new(name, 10, 0)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 2
          expect(items[1].quality).to eq 2
        end
      end

      context "sell_in > 10" do
        it "quality が 1 あがる" do
          items = [Item.new(name, 11, 0)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 1
        end
      end

      it "quality は 50以上にはならない" do
        items = [Item.new(name, 1, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 50
      end
    end

    context "name = Conjured" do
      let(:name) { "Conjured" }

      it "通常のアイテムの二倍の速度で劣化する" do
        first_quality = 50
        default_items = [Item.new("foo", 1, first_quality)]
        items = [Item.new(name, 1, first_quality)]
        GildedRose.new(default_items).update_quality()
        GildedRose.new(items).update_quality()
        expect(first_quality - items[0].quality).to eq(2 * (first_quality - default_items[0].quality))  
      end
    end
  end
end
