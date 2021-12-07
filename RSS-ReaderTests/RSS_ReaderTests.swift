//
//  RSS_ReaderTests.swift
//  RSS-ReaderTests
//
//  Created by MBAir on 12/7/21.
//

import XCTest
@testable import RSS_Reader
import FeedKit

class RSS_ReaderTests: XCTestCase {

    func testRSSParser() {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "RSSXMLTest", withExtension: "xml")
        else {
            fatalError()
        }
        let parser = FeedParser(URL: url)
        
        do {
            let feed = try parser.parse().get().rssFeed
            XCTAssertNotNil(feed)
        } catch {
            XCTFail("Couldn't Parse XML File")
        }
        
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
