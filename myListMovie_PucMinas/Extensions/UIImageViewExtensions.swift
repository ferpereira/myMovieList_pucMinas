//
//  UIImageViewExtensions.swift
//  myListMovie_PucMinas
//
//  Created by Fernando Manoel on 18/08/22.
//

import Foundation
import Alamofire

extension UIImageView {
    func download(from url: String, completionHandler: ((UIImage?) -> Void)? = nil) {
        AF.request(url).responseData { (response) in
            guard let data = response.data else { return }
            self.image = UIImage(data: data)
            
            if let handler = completionHandler {
                handler(self.image)
            }
        }
    }
}
