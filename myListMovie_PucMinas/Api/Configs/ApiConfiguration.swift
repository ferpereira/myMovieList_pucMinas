//
//  ApiConfiguration.swift
//  myListMovie_PucMinas
//
//  Created by Fernando Manoel on 17/08/22.
//

import Foundation
import Alamofire

private enum ApiConfigurationKeys: String {
    case url = "url"
    case publicKey = "publicKey"
    case privateKey = "privateKey"
}

class ApiConfiguration {
    
    static let shared = ApiConfiguration()
    
    static var suitName: String = "ListaDefault"
    
    private let defaults = UserDefaults.init(suiteName: ApiConfiguration.suitName)!
    
    var url: String {
        get {
            self.defaults.string(forKey: ApiConfigurationKeys.url.rawValue)!
        }
        
        set {
            self.storeUrl(url: newValue)
        }
    }
    
    var publicKey: String {
        get {
            self.defaults.string(forKey: ApiConfigurationKeys.publicKey.rawValue)!
        }
        
        set {
            self.storePublicKey(publicKey: newValue)
        }
    }
    
    var privateKey: String {
        get {
            self.defaults.string(forKey: ApiConfigurationKeys.privateKey.rawValue)!
        }
        
        set {
            self.storePrivateKey(privateKey: newValue)
        }
    }
    
    private init() {
        if self.defaults.string(forKey: ApiConfigurationKeys.privateKey.rawValue) == nil {
            let fileUrl = Bundle.main.url(forResource: "ApiConfiguration", withExtension: "json")!
            let jsonData = try! Data(contentsOf: fileUrl)
            let properties = try! JSONDecoder().decode(Dictionary<String, String>.self, from: jsonData)
            self.setProperties(properties: properties)
        }
    }
    
    private func setProperties(properties: Dictionary<String, String>) {
        self.storeUrl(url: properties[ApiConfigurationKeys.url.rawValue]!)
        self.storePublicKey(publicKey: properties[ApiConfigurationKeys.publicKey.rawValue]!)
        self.storePrivateKey(privateKey: properties[ApiConfigurationKeys.privateKey.rawValue]!)
    }
    
    private func storeUrl(url: String) {
        self.defaults.set(url, forKey: ApiConfigurationKeys.url.rawValue)
    }
    
    private func storePublicKey(publicKey: String) {
        self.defaults.set(publicKey, forKey: ApiConfigurationKeys.publicKey.rawValue)
    }
    
    private func storePrivateKey(privateKey: String) {
        self.defaults.set(privateKey, forKey: ApiConfigurationKeys.privateKey.rawValue)
    }
    
    func url(with path: String) -> String {
        return "\(url)\(path)";
    }
    
    func params() -> ApiParams {
        let timestamp = String(Date().timeIntervalSince1970 * 1000)
        
        return ApiParams()
            .limit(100)
            .hash(ts: timestamp, privateKey: self.privateKey, publicKey: self.publicKey)
            .timestamp(timestamp)
            .apikey(self.publicKey)
    }
}
