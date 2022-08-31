//
//  ThumbnailTest.swift
//  myListMovie_PucMinasTests
//
//  Created by fernando pereira on 31/08/22.
//

import XCTest
@testable import myListMovie_PucMinas

class ThumbnailTest: XCTestCase {
    
    var thumbnail: Thumbnail!
    let path = "http://fakeimage.com/etc"
    let ext = "png"
    
    override func setUp() {
        self.thumbnail = Thumbnail(path: self.path, extension: self.ext)
    }
    
    func testShouldReturnUrlPath() {
        let type: ThumbnailType = .detail
        let urlPath = self.thumbnail.urlPath(type: type)
        let expectedPath = "\(self.path)/\(type.rawValue).\(self.ext)"
        XCTAssertEqual(urlPath, expectedPath)
    }
}
