//
//  Events.swift
//  myListMovie_PucMinas
//
//  Created by Fernando Manoel on 18/08/22.
//

struct Events: Codable {
    var available: Int
    var collectionURI: String
    var items: [Resource]
    var returned: Int
}

