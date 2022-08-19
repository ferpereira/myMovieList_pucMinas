//
//  HashGenerator.swift
//  myListMovie_PucMinas
//
//  Created by Fernando Manoel on 17/08/22.
//

import Foundation

struct HashGenerator {
    
    static func hash(ts: String, privateKey: String, publicKey: String) -> String{
        return "\(ts)\(privateKey)\(publicKey)".md5()
    }
}
