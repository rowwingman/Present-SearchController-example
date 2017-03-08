//
//  SearchBarInTableViewController.swift
//  SearchControllerExample
//
//  Created by Maksym Prokopchuk on 8/3/17.
//  Copyright © 2017 Maksym Prokopchuk. All rights reserved.
//

import UIKit

class SearchBarInTableViewController: UIViewController {

    // MARK: - UI elements
    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
//        searchController.searchResultsUpdater = self
//        searchController.delegate = self
//        searchController.searchBar.delegate = self
        
        return searchController
    }()


    let tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    let data: [String] = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"]

    let kCellIdentifier = "identifier"

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "TableView"



        self.view.addSubview(tableView)

        let views = ["tableView" : tableView]
        let formatString = "|[tableView]|"

        let constraints = NSLayoutConstraint.constraints(withVisualFormat: formatString, options:[.alignAllTop] , metrics: nil, views: views)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[tableView]|", options:[.alignAllTop] , metrics: nil, views: views)

        NSLayoutConstraint.activate(constraints)
        NSLayoutConstraint.activate(verticalConstraints)



        self.view.backgroundColor = UIColor.white
        self.tableView.dataSource = self

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: kCellIdentifier)

        self.searchController.searchBar.sizeToFit()
        self.tableView.tableHeaderView = self.searchController.searchBar
    }

}

extension SearchBarInTableViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier, for: indexPath)
        cell.textLabel?.text = self.data[indexPath.row]
        return cell
    }

}
