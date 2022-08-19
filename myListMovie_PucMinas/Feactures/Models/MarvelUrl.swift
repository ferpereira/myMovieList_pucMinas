//
//  MarvelUrl.swift
//  myListMovie_PucMinas
//
//  Created by Fernando Manoel on 18/08/22.
//

enum MarvelUrlType: String, Codable {
    case detail = "detail"
    case comiclink = "comiclink"
    case wiki = "wiki"
}

struct MarvelUrl: Codable {
    var type: MarvelUrlType
    var url: String
}
