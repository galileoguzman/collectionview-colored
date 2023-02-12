//
//  ViewController.swift
//  PinterestInterview
//
//  Created by Galileo Guzman on 08/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViewController()
    }
    
    private func initViewController() {
        collectionView.backgroundColor = .purple
        view.backgroundColor = .purple
        
        viewModel.elementsDidChange = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    private func updateCollectionViewItem(for indexPath: IndexPath) {
//        viewModel.toogleCurrentColumn(for: indexPath)
        
//        viewModel.toogleCurrentRow(for: indexPath)
        
//        viewModel.toogleFollowingItemsInRow(for: indexPath)
        
        viewModel.toogleFollowingItemsInColumn(for: indexPath)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let presentable = viewModel.presentable(for: indexPath)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell", for: indexPath) as UICollectionViewCell
        cell.backgroundColor = presentable.backgroundColor
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Row: \(indexPath.section) - Column: \(indexPath.row)")
        updateCollectionViewItem(for: indexPath)
    }
}
