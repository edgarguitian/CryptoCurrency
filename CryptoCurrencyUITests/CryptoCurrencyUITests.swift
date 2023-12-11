//
//  CryptoCurrencyUITests.swift
//  CryptoCurrencyUITests
//
//  Created by Edgar Guitian Rey on 6/12/23.
//

import XCTest

final class CryptoCurrencyUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func test_select_element_list_success() {
        let app = XCUIApplication()
        app.launch()
        app.activate()
        let listView = app.collectionViews["listCryptos"]
        listView.buttons["01coin"].tap()
    }
    
    func test_scroll_list_success() {
        let app = XCUIApplication()
        app.launch()
        app.activate()
        let listView = app.collectionViews["listCryptos"]
        for _ in 0..<6 {
            listView.swipeUp()
        }
        let lastItemRowView = listView.buttons["3A"]
        
        XCTAssertTrue(lastItemRowView.exists)
        
        lastItemRowView.tap()
    }
    
    func test_search_list_success() {
        let app = XCUIApplication()
        app.launch()
        app.activate()
        
        let searchField = app.navigationBars["List Cryptos"].searchFields["Search"]
        XCTAssertTrue(searchField.exists)

        searchField.tap()
        searchField.typeText("Free")

        app.collectionViews["listCryptos"]/*@START_MENU_TOKEN@*/.staticTexts["0xFreelance"]/*[[".cells",".buttons[\"0xFreelance\"].staticTexts[\"0xFreelance\"]",".staticTexts[\"0xFreelance\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
                
    }
}

