//
//  Events.swift
//  myListMovie_PucMinas
//
//  Created by Fernando Manoel on 18/08/22.
//

struct Events: Codable {
    var available: Int
    var colletionURI: String
    var itens: [Resource]
    var returned: Int
}

