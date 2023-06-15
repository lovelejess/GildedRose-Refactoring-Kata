public class GildedRose {
    var items: [Item]

    public init(items: [Item]) {
        self.items = items
    }

    public func updateQuality() {
        for item in items {
            if item.name != "Aged Brie", item.name != "Backstage passes to a TAFKAL80ETC concert" {
                if item.quality > 0 {
                    if item.name != "Sulfuras, Hand of Ragnaros" {
                        item.quality = item.quality - 1
                    }
                }
            } else {
                if item.quality < 50 {
                    item.quality = item.quality + 1

                    if item.name == "Backstage passes to a TAFKAL80ETC concert" {
                        if item.sellIn < 11 {
                            // TODO: Pull into func
                            if item.quality < 50 {
                                item.quality = item.quality + 1
                            }
                        }

                        if item.sellIn < 6 {
                            // TODO: Pull into func
                            if item.quality < 50 {
                                item.quality = item.quality + 1
                            }
                        }
                    }
                }
            }

            reduceSellIn(item: item)

            if item.sellIn < 0 {
                if item.name != "Aged Brie" {
                    if item.name != "Backstage passes to a TAFKAL80ETC concert" {
                        if item.quality > 0 {
                            if item.name != "Sulfuras, Hand of Ragnaros" {
                                item.quality = item.quality - 1
                            }
                        }
                    } else {
                        item.quality = 0
                    }
                } else {
                    // TODO: Pull into func
                    if item.quality < 50 {
                        item.quality = item.quality + 1
                    }
                }
            }
        }
    }

    private func reduceSellIn(item: Item) {
        if item.name != "Sulfuras, Hand of Ragnaros" {
            item.sellIn = item.sellIn - 1
        }
    }


}
