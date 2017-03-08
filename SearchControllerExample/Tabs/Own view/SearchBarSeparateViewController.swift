//
//  SearchBarSeparateViewController.swift
//  SearchControllerExample
//
//  Created by Maksym Prokopchuk on 8/3/17.
//  Copyright © 2017 Maksym Prokopchuk. All rights reserved.
//

import UIKit

class SearchBarSeparateViewController: UIViewController {

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

        self.title = "Separate View"
        self.view.backgroundColor = UIColor.white

        self.view.addSubview(self.searchController.searchBar)

        self.searchController.searchBar.sizeToFit()

        self.edgesForExtendedLayout = []
    }

}
