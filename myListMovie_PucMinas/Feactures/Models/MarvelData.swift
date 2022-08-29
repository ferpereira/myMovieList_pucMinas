//
//  MarvelData.swift
//  myListMovie_PucMinas
//
//  Created by Fernando Manoel on 18/08/22.
//

struct MarvelData: Codable{
    var offset: Int
    var limit: Int
    var total: Int
    var count: Int
    var results: [MarvelCharacter]

    func hasMore()-> Bool {
        return (offset + count) < total
    }
}
