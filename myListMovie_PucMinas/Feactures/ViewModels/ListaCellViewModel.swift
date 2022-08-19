//
//  ListaCellViewModel.swift
//  myListMovie_PucMinas
//
//  Created by Fernando Manoel on 18/08/22.
//

import Foundation
import Alamofire

class ListaCellViewModel {
    var service: MarvelService!
    var character: MarvelCharacter!
    
    var thumbnailURL: String {
        return self.character.thumbnail.urlPath(type: .portraitMedium)
    }
    
    var characterName: String {
        return self.character.name
    }
    
    init(service: MarvelService, character: MarvelCharacter) {
        self.service = service
        self.character = character
    }
}
