//
//  ListaCollectionViewController.swift
//  myListMovie_PucMinas
//
//  Created by Fernando Manoel on 17/08/22.
//


import UIKit

class ListaCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var stackViewNotFound: UIStackView!
    @IBOutlet weak var imageViewNotFound: UIImageView!
    @IBOutlet weak var labelNotFound: UILabel!

    
    private var viewModel: ListaViewModel!
    private let cellIdentifier = "ListaCell"
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    private let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = ListaViewModel(
            service: MarvelService(
                config: ApiConfiguration.shared
            )
        )
        
        self.setupSearchBar()
        self.fetchCharacters(offset: 0)
    }
    
    func setupSearchBar() {
        self.searchController.searchResultsUpdater = self
        self.searchController.delegate = self
        self.searchController.searchBar.delegate = self
        
        searchController.searchBar.placeholder = "Buscar seu heroi favorito"
        searchController.searchBar.sizeToFit()
        searchController.searchBar.searchTextField.textColor = .white
        searchController.searchBar.becomeFirstResponder()
        
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = true
    }
        
    func fetchCharacters(offset: Int, name: String? = nil) {
        self.view.showActivityIndicator(self.activityIndicator)
        self.activityIndicator.startAnimating()
        self.viewModel.fetchCharacters(offset: offset, name: name) {
            self.view.hideActivityIndicator(self.activityIndicator)
            self.collectionView.reloadData()
        }
    }
    
    func hideNotFoundMessage() {
        self.imageViewNotFound.alpha = 0
        self.labelNotFound.alpha = 0
    }
    
    func showNotFoundMessage() {
        UIView.animate(withDuration: 0.7, animations: {
            self.imageViewNotFound.alpha = 1
            self.view.layoutIfNeeded()
        }) { _ in
            UIView.animate(withDuration: 0.7) {
                self.labelNotFound.alpha = 1
                self.view.layoutIfNeeded()
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! ListaDetailViewController
        let indexPath = self.collectionView.indexPathsForSelectedItems?.first
        viewController.viewModel = self.viewModel.detailViewModel(for: indexPath!)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as! ListaCollectionViewCell
        cell.viewModel = self.viewModel.cellViewModel(for: indexPath)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let name = self.searchController.searchBar.text
        self.viewModel.fetchIfNeeded(for: indexPath, name: name) {
            self.collectionView.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.numberOfItems()
    }
    
}

extension ListaCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width * 0.28, height: 180)
    }
    
}

extension ListaCollectionViewController: UISearchControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let name = searchBar.text {
            self.hideNotFoundMessage()
            self.view.showActivityIndicator(self.activityIndicator)
            self.viewModel.fetchCharactersByName(name: name) {
                self.collectionView.reloadData()
                self.view.hideActivityIndicator(self.activityIndicator)
                
                if self.viewModel.numberOfItems() == 0 {
                    self.showNotFoundMessage()
                }
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        if !searchBar.text!.isEmpty {
            searchBar.text = ""
            self.hideNotFoundMessage()
            self.fetchCharacters(offset: 0)
        }
    }
}
