//
//  SearchBarInNavigationBarViewController.swift
//  SearchControllerExample
//
//  Created by Maksym Prokopchuk on 8/3/17.
//  Copyright © 2017 Maksym Prokopchuk. All rights reserved.
//

import UIKit

class SearchBarInNavigationBarViewController: UIViewController {

    // MARK: - UI elements
    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
//        searchController.searchResultsUpdater = self
//        searchController.delegate = self
        searchController.searchBar.delegate = self

        return searchController
    }()

    lazy var searchBarButtonItem: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(p_tapSearchButton(_:)))

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "NavigationBar"

        self.view.backgroundColor = UIColor.white


        self.navigationItem.rightBarButtonItem = self.searchBarButtonItem
    }

    func p_tapSearchButton(_ button: UIButton) {

    }

}

extension SearchBarInNavigationBarViewController: UISearchBarDelegate {

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }

}
