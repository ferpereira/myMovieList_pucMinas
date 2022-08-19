//
//  Series.swift
//  myListMovie_PucMinas
//
//  Created by Fernando Manoel on 18/08/22.
//

struct Series: Codable {
    var available: Int
    var collectionURI: String
    var items: [Resource]
}
