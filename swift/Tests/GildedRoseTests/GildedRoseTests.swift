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

    func test_updateQuality_retainsSellIn_wheItemIsSulfuras() {
        let sulfuras = [Item(name:"Sulfuras, Hand of Ragnaros", sellIn: 100, quality: 0)]
        let app = GildedRose(items: sulfuras)
        app.updateQuality()
        XCTAssertEqual(app.items[0].sellIn, 100)
    }

    func test_updateQuality_by1_whenItemIsAgedBrie_andQualitlyIsLessthan50_andSellInIsLessThan0() {
        let agedBrie = [Item(name:"Aged Brie", sellIn: -1, quality: 49)]
        let app = GildedRose(items: agedBrie)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 50)
    }

    func test_updateQuality_reducesQualityTo0_whenItemIsABackstagePass() {
        let backstagePass = [Item(name:"Backstage passes to a TAFKAL80ETC concert", sellIn: -1, quality: 49)]
        let app = GildedRose(items: backstagePass)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 0)
    }

    func test_updateQuality_reducesQualityBy1_whenQualityIsGreaterTHan0_andItemIsNotSulfuras() {
        let trash = [Item(name:"Trash", sellIn: -1, quality: 75)]
        let app = GildedRose(items: trash)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 73)
    }

    // MARK: - Isolated tests for the second part
    func test_secondPart_itemRemainsTheSame_whenSellInIsGreatherOrEqualToZero() {
        let item = Item(name: "Nice Item", sellIn: 0, quality: 49)
        let app = GildedRose(items: [item])
        app.updateQuality(item: item)
        XCTAssertEqual(item.quality, 49)
        XCTAssertEqual(item.name, "Nice Item")
        XCTAssertEqual(item.sellIn, 0)
    }
}
