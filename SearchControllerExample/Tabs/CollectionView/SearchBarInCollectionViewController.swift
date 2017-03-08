//
//  SearchBarInCollectionViewController.swift
//  SearchControllerExample
//
//  Created by Maksym Prokopchuk on 8/3/17.
//  Copyright © 2017 Maksym Prokopchuk. All rights reserved.
//

import UIKit

class SearchBarInCollectionViewController: UIViewController {

    // MARK: - UI elements
    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
//        searchController.searchResultsUpdater = self
//        searchController.delegate = self
//        searchController.searchBar.delegate = self

        return searchController
    }()

    fileprivate let kCategoryCellIdentifier = "MainContentCategoryCollectionViewCellIdentifier"

    lazy var collectionViewLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 1.0
//        layout.minimumInteritemSpacing = 1.0
//        layout.sectionInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        layout.itemSize = CGSize(width: 150.0, height: 150.0)
//        layout.sectionInset = UIEdgeInsetsMake(16.0, 8.0, 16.0, 8.0)
        return layout
    }()

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: self.collectionViewLayout)
        collectionView.backgroundColor = UIColor.gray
        collectionView.alwaysBounceVertical = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "CollectionView"

        self.view.backgroundColor = UIColor.gray


        self.view.addSubview(self.collectionView)

        let views = ["collectionView" : collectionView]
        let formatString = "|[collectionView]|"

        let constraints = NSLayoutConstraint.constraints(withVisualFormat: formatString, options:[.alignAllTop] , metrics: nil, views: views)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[collectionView]|", options:[.alignAllTop] , metrics: nil, views: views)

        NSLayoutConstraint.activate(constraints)
        NSLayoutConstraint.activate(verticalConstraints)



        self.collectionView.register(UICollectionViewCell.self,
                                     forCellWithReuseIdentifier: self.kCategoryCellIdentifier)

        self.collectionView.register(SearcBarCollectionReusableView.self,
                                     forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
                                     withReuseIdentifier: "headerView")

        self.collectionViewLayout.headerReferenceSize = CGSize(width: self.collectionView.bounds.width, height: 100.0)


        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }

}

//MARK: UICollectionViewDataSource
extension SearchBarInCollectionViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.kCategoryCellIdentifier, for: indexPath)
        return cell
    }

    // http://stackoverflow.com/questions/21731318/add-a-simple-uiview-as-header-of-uicollectionview
    // http://stackoverflow.com/questions/24962282/cant-use-uisearchcontroller-with-uicollectionview
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader,
                                                                         withReuseIdentifier: "headerView",
                                                                         for: indexPath)
        if headerView is SearcBarCollectionReusableView {
            if self.searchController.searchBar.superview == nil {
                headerView.addSubview(self.searchController.searchBar)
            }
            self.searchController.searchBar.sizeToFit()
        }

        return headerView
    }

}

//MARK: UICollectionViewDelegateFlowLayout
extension SearchBarInCollectionViewController: UICollectionViewDelegateFlowLayout {
    
}
