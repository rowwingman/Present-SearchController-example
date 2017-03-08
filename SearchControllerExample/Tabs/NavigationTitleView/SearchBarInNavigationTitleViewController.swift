//
//  SearchBarInNavigationTitleViewController.swift
//  SearchControllerExample
//
//  Created by Maksym Prokopchuk on 8/3/17.
//  Copyright © 2017 Maksym Prokopchuk. All rights reserved.
//

import UIKit

class SearchBarInNavigationTitleViewController: UIViewController {

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

        self.view.backgroundColor = UIColor.white

        self.searchController.searchBar.sizeToFit()
        self.navigationItem.titleView = self.searchController.searchBar

        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = true
        self.definesPresentationContext = true


        // customize navigationbar color
        self.navigationController?.navigationBar.barTintColor = UIColor.blue
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }

}
