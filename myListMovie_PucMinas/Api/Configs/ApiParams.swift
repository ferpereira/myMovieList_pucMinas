//
//  ApiParams.swift
//  myListMovie_PucMinas
//
//  Created by Fernando Manoel on 17/08/22.
//

import Foundation
import Alamofire

class ApiParams {
    private var params = Parameters()
    
    private let defaultParams: Parameters = [
        "limit": 100,
        "orderBy": "-modified",
    ]
    
    init() {
        self.params = self.defaultParams
    }
    
    func hash(ts: String, privateKey: String, publicKey: String)-> ApiParams{
        self.params["hash"] = HashGenerator.hash(ts: ts, privateKey: privateKey, publicKey:publicKey)
        return self
    }
    
    func apikey(_ apikey: String)-> ApiParams{
        self.params["apikey"] = apikey
        return self
    }
    
    func timestamp(_ timestamp: String)-> ApiParams{
        self.params["ts"] = timestamp
        return self
    }
    
    func name(_ name: String)-> ApiParams{
        self.params["nameStartWith"] = name
        return self
    }
    
    func offset(_ offset: Int)-> ApiParams{
        self.params["offset"] = offset
        return self
    }
    
    func limit(_ limit:Int)-> ApiParams {
        self.params["limit"] = limit
        return self
    }
    
    func orderBy(_ orderBy: String)-> ApiParams{
        self.params["orderBy"] = orderBy
        return self
    }
    
    func build()-> Parameters{
        return self.params
    }
}
