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
}
