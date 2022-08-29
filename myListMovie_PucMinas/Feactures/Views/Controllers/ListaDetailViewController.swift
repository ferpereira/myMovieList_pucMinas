//
//  ListaDetailViewController.swift
//  myListMovie_PucMinas
//
//  Created by Fernando Manoel on 17/08/22.
//

import UIKit

class ListaDetailViewController: UIViewController {

    var viewModel: ListaDetailViewModel!
    var activityIndicator = UIActivityIndicatorView(style: .large)
    
    @IBOutlet weak var imageViewThumbnail: UIImageView!
    @IBOutlet weak var labelCharacterName: UILabel!
    @IBOutlet weak var labelCharacterDescription: UILabel!
    @IBOutlet weak var constraintStackButtonsHeight: NSLayoutConstraint!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
        
    private func showDetalhes() {
        
        self.view.layoutIfNeeded()
    
        UIView.animate(withDuration: 0.7) {
            self.view.layoutIfNeeded()
        }
    }
       
    private func setupThumbnail() {
        self.imageViewThumbnail.download(from: self.viewModel.thumbnailURL) { (data) in
            self.view.hideActivityIndicator(self.activityIndicator)
            self.showDetalhes()
        }
    }
    
    func setupUI() {
        self.title = self.viewModel.characterName()
        self.view.showActivityIndicator(self.activityIndicator)
        self.setupThumbnail()
        self.labelCharacterName.text = "\(self.viewModel.characterName()) ·"
        
        let description = self.viewModel.characterDescription()
        self.labelCharacterDescription.text = description.isEmpty ? "Sem descrição disponível." : description
    }
    
    
}
