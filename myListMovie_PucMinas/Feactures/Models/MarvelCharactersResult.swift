//
//  MarvelCharactersResult.swift
//  myListMovie_PucMinas
//
//  Created by Fernando Manoel on 18/08/22.
//

struct MarvelCharactersResult: Codable {
    var code: Int
    var status: String
    var copyright: String
    var attributionText: String
    var attributionHTML: String
    var etag: String
    var data: MarvelData
}

