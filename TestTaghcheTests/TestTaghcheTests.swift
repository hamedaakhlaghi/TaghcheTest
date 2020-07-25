//
//  TestTaghcheTests.swift
//  TestTaghcheTests
//
//  Created by Hamed on 7/21/20.
//  Copyright © 2020 Hamed. All rights reserved.
//

import XCTest
@testable import TestTaghche

class TestTaghcheTests: XCTestCase {

    override func setUp() {
        
    }

    override func tearDown() {
        
    }

    func testDollarPrice() {
        let currcyConvertor = CurrencyConvertor()
        // 25000 toman = 1$
        var dollarPrice = currcyConvertor.computeDollarPrice(rial: 25000)
        XCTAssertEqual(dollarPrice, 1)
        
        // 12500 toman = 0.5
        dollarPrice = currcyConvertor.computeDollarPrice(rial: 12500)
        XCTAssertEqual(dollarPrice, 0.5)
    
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
