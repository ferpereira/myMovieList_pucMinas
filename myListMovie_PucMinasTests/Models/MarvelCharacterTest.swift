//
//  MarvelCharacterTest.swift
//  myListMovie_PucMinasTests
//
//  Created by fernando pereira on 31/08/22.
//

import XCTest
@testable import myListMovie_PucMinas

class MarvelCharacterTest: XCTestCase {
    
    var character: MarvelCharacter!
    
    override func setUp() {
        self.character = MarvelCharacter()
    }
    
    func testShouldReturnNilWhenNoUrlInformed() {
        let url = self.character.getLink(to: .comiclink)
        XCTAssertNil(url)
    }
    
    func testShouldReturnUrlByType() {
        let marvelUrl = MarvelUrl(type: .comiclink, url: "http://fakeimage.com/etc.png")
        self.character.urls.append(marvelUrl)
        let existingUrl = self.character.getLink(to: .comiclink)
        let notExistingUrl = self.character.getLink(to: .detail)
        
        XCTAssertEqual(marvelUrl.url, existingUrl?.url)
        XCTAssertNil(notExistingUrl)
    }
    
    override func tearDown() {
        character = nil
    }
    
}

