//
//  AccessoPuppyGramTests.swift
//  AccessoPuppyGramTests
//
//  Created by James Folk on 7/26/22.
//

import XCTest
import Combine
@testable import AccessoPuppyGram

class AccessoPuppyGramTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    func testPuppyGramViewModel_getPuppyGramElements() throws {
        
        let viewModel = PuppyGramViewModel()
        let expectation = self.expectation(description: "PuppyGramElement.get(.photos_public)")
        let myError = viewModel.getPuppyGramElements(onCompletion: { expectation.fulfill() })
        
        waitForExpectations(timeout: 10)
        
        XCTAssertNil(myError)
        XCTAssertNotEqual(viewModel.items.count, 0)
    }

}
