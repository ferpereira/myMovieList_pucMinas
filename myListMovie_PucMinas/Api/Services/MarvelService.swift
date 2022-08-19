//
//  MarvelService.swift
//  myListMovie_PucMinas
//
//  Created by Fernando Manoel on 18/08/22.
//

import Foundation
import Alamofire

class MarvelService {
    var config: ApiConfiguration
    
    init(config: ApiConfiguration) {
        self.config = config
    }
    
    func characters(offset: Int, name: String? = nil, completionHandler: @escaping (AFDataResponse<MarvelCharactersResult>)-> Void) {
        var params = config.params().offset(offset)
        
        if let name = name {
            if !name.isEmpty{
                params = params.name(name)
            }
        }
        AF.request(config.url(with: "characters"), parameters: params.build(), encoding: URLEncoding.queryString).responseDecodable(of: MarvelCharactersResult.self, completionHandler: completionHandler)
    }
    
}
