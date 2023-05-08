@testable import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {
    func testFoo() throws {
        let items = [Item(name: "foo", sellIn: 0, quality: 0)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].name, "foo")
    }

    func test_updateQuality_decreaseSellIn_whenItemIsNotSulfuras() {
        let items = [Item(name: "foo", sellIn: 10, quality: 0)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].sellIn, 9)
    }
}

/*

if items[i].name != "Aged Brie", items[i].name != "Backstage passes to a TAFKAL80ETC concert" {
    if items[i].quality > 0 {
        if items[i].name != "Sulfuras, Hand of Ragnaros" {
            items[i].quality = items[i].quality - 1
        }
    }
} else {
    if items[i].quality < 50 {
        items[i].quality = items[i].quality + 1

        if items[i].name == "Backstage passes to a TAFKAL80ETC concert" {
            if items[i].sellIn < 11 {
                if items[i].quality < 50 {
                    items[i].quality = items[i].quality + 1
                }
            }

            if items[i].sellIn < 6 {
                if items[i].quality < 50 {
                    items[i].quality = items[i].quality + 1
                }
            }
        }
    }
}

if items[i].name != "Sulfuras, Hand of Ragnaros" {
    items[i].sellIn = items[i].sellIn - 1
}

if items[i].sellIn < 0 {
    if items[i].name != "Aged Brie" {
        if items[i].name != "Backstage passes to a TAFKAL80ETC concert" {
            if items[i].quality > 0 {
                if items[i].name != "Sulfuras, Hand of Ragnaros" {
                    items[i].quality = items[i].quality - 1
                }
            }
        } else {
            items[i].quality = items[i].quality - items[i].quality
        }
    } else {
        if items[i].quality < 50 {
            items[i].quality = items[i].quality + 1
        }
    }
}

*/
