//
//  UIViewControllerExtensions.swift
//  myListMovie_PucMinas
//
//  Created by Fernando Manoel on 18/08/22.
//

import Foundation
import UIKit

extension UIView {
    
    func showActivityIndicator(_ activityIndicator: UIActivityIndicatorView) {
        activityIndicator.startAnimating()
        activityIndicator.center = self.center
        activityIndicator.color = .white
        self.addSubview(activityIndicator)
    }
    
    func hideActivityIndicator(_ activityIndicator: UIActivityIndicatorView) {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
    
}
