use std::cmp::min;
use std::fmt::{self, Display};
pub struct Item {
    pub name: String,
    pub sell_in: i32,
    pub quality: i32,
}

impl Item {
    pub fn new(name: impl Into<String>, sell_in: i32, quality: i32) -> Item {
        Item {
            name: name.into(),
            sell_in,
            quality,
        }
    }

    pub fn next_day(&mut self) {
        match &*self.name {
            "Sulfuras, Hand of Ragnaros" => (),
            "Aged Brie" => {
                self.quality = min(self.quality + 1, 50);
                self.sell_in -= 1;
            }
            "Backstage passes to a TAFKAL80ETC concert" => {
                let increment = match self.sell_in {
                    1..=5 => 3,
                    6..=10 => 2,
                    _ => 1,
                };
                self.quality = if self.sell_in <= 0 { 0 } else { self.quality + increment };
                self.sell_in -= 1;
            }
            _ => {
                self.quality -= 1;
                self.sell_in -= 1;
            }
        };
    }
}

impl Display for Item {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{}, {}, {}", self.name, self.sell_in, self.quality)
    }
}

pub struct GildedRose {
    pub items: Vec<Item>,
}

impl GildedRose {
    pub fn new(items: Vec<Item>) -> GildedRose {
        GildedRose { items }
    }

    pub fn update_quality(&mut self) {
        for item in &mut self.items {
            item.next_day();
        }
    }
}

#[cfg(test)]
mod tests {
    use super::{GildedRose, Item};
    use rstest::*;
    use speculate::speculate;

    speculate! {
        describe "Decrease sell_in and quality of an Item in next day" {
            #[fixture]
            fn rose_foo() -> GildedRose {
                let items = vec![Item::new("foo", 1, 1)];
                GildedRose::new(items)
            }

            #[rstest]
            fn decrease_positive_sell_in_by_1(mut rose_foo: GildedRose) {
                rose_foo.update_quality();
                assert_eq!(rose_foo.items[0].sell_in, 0);
            }

            #[rstest]
            fn decrease_quality_by_1(mut rose_foo: GildedRose) {
                rose_foo.update_quality();
                assert_eq!(rose_foo.items[0].quality, 0);
            }
        }

        describe "Sulfuras is never sold nor degraded" {
            #[rstest]
            fn keep_sulfuras_constant() {
                let items = vec![
                    Item::new("Sulfuras, Hand of Ragnaros", 0, 80),
                    Item::new("Sulfuras, Hand of Ragnaros", -1, 80)
                ];
                let mut rose = GildedRose::new(items);
                rose.update_quality();
                assert_eq!((rose.items[0].sell_in, rose.items[0].quality), (0, 80));
                assert_eq!((rose.items[1].sell_in, rose.items[1].quality), (-1, 80));
            }
        }
    }
}
