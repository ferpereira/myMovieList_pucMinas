//
//  MarvelCharacter.swift
//  myListMovie_PucMinas
//
//  Created by Fernando Manoel on 18/08/22.
//

struct MarvelCharacter: Codable {
    var id: Int!
    var name: String!
    var description: String!
    var modified: String!
    var thumbnail: Thumbnail!
    var resourceURI: String!
    var comics: Comics!
    var series: Series!
    var stories: Stories!
    var events: Events!
    var urls: [MarvelUrl]! = []
    
    func getLink(to type: MarvelUrlType) -> MarvelUrl?{
        return urls.filter {
            (url)-> Bool in return url.type == type
        }.first ?? nil
    }
}
