//
//  MasterViewController.swift
//  MindMap
//
//  Created by Jeff on 8/27/16.
//  Copyright © 2016 Jeff Small. All rights reserved.
//

import UIKit
import CoreData

class ListsViewController: UITableViewController {
    override func viewDidLoad() {
        tableView.dataSource = ListsTableViewDataSource()
    }
}
