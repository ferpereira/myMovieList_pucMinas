//
//  HashGeneratorTest.swift
//  myListMovie_PucMinasTests
//
//  Created by fernando pereira on 31/08/22.
//

import XCTest
@testable import myListMovie_PucMinas

class HashGeneratorTest: XCTestCase {
    
    let publicKey = "fake_public_key"
    let privateKey = "fake_private_key"
    let ts = "157"
    
    func testShouldGenerateHash() {
        let hash = HashGenerator.hash(ts: ts, privateKey: privateKey, publicKey: publicKey)
        XCTAssertEqual(hash, "f7a7dec8446043587f23de2449c46149")
    }
    
    
}
