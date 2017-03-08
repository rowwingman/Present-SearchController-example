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

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "CollectionView"

        self.view.backgroundColor = UIColor.white
    }

}
