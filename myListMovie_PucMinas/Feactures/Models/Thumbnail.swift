//
//  Thumbnail.swift
//  myListMovie_PucMinas
//
//  Created by Fernando Manoel on 18/08/22.
//

import UIKit

struct Thumbnail: Codable {
    
    var path: String
    var `extension`: String
    
    func urlPath(type: ThumbnailType)-> String {
        return "\(path)/\(type.rawValue).\(`extension`)"
    }
}
