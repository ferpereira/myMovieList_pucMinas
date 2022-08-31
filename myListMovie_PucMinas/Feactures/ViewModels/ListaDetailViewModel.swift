//
//  ListaDetailViewModel.swift
//  myListMovie_PucMinas
//
//  Created by Fernando Manoel on 18/08/22.
//

import Foundation
import Alamofire

class ListaDetailViewModel {
    
    private var service: MarvelService!
    private var character: MarvelCharacter!

    var thumbnailURL: String {
        return self.character.thumbnail.urlPath(type: .portraitFantastic)
    }
    
    func characterName() -> String {
        return self.character.name
    }
    
    func characterDescription() -> String {
        return self.character.description
    }
    
    func getLink(to type: MarvelUrlType) -> MarvelUrl? {
        return self.character.getLink(to: type)
    }
    
    init(service: MarvelService, character: MarvelCharacter) {
        self.service = service
        self.character = character
    }
}
