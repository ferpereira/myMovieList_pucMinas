//
//  ListaCollectionViewCell.swift
//  myListMovie_PucMinas
//
//  Created by fernando pereira on 24/08/22.
//

import UIKit

class ListaCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageViewCharacter: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    
    var viewModel: ListaCellViewModel! {
        didSet {
            self.imageViewCharacter.download(from: self.viewModel.thumbnailURL)
            self.labelName.text = "\(self.viewModel.characterName) ·"
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.imageViewCharacter.image = nil
    }
}

