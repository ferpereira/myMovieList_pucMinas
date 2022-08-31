//
//  StringExtensionsTest.swift
//  myListMovie_PucMinasTests
//
//  Created by fernando pereira on 31/08/22.
//

import XCTest
@testable import myListMovie_PucMinas

class StringExtensionsTest: XCTestCase {

    func testShouldGenerateMD5() {
        let phrase = "Wolverine is one of the best superhero stories"
        let expectedMD5 = "72f223831ae66b6277b9010c85d5fe70"
        XCTAssertEqual(phrase.md5(), expectedMD5)
    }
}
