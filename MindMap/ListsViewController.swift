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
    @IBOutlet var newListView: UIView!
    @IBOutlet weak var newListNameTextField: UITextField!
    var dataSource = ListsTableViewDataSource()
    var tableViewDelegate = ListsTableViewDelegate()
    
    override func viewDidLoad() {
        tableView.dataSource = dataSource
        tableView.delegate = tableViewDelegate
        tableView.tableFooterView = UIView()
        
        ListStore.store.observers.append(self)
    }
}

extension ListsViewController {
    func showNewListView(with completion: (() -> Void)? = nil) {
        guard let newListViewController = Storyboards
            .storyboard(withIdentifier: StoryboardIdentifier.Main)
            .instantiateViewController(withIdentifier: "newListViewController") as? NewListViewController else
        {
            return
        }
        
        present(newListViewController, animated: true, completion: nil)
    }
}

extension ListsViewController: ListStoreObservable {
    func listsUpdated() {
        dataSource.lists = ListStore.store.lists
        tableView.reloadData()
    }
}

// MARK: IBActions
extension ListsViewController {
    @IBAction func newListItemTapped(_ sender: AnyObject) {
        showNewListView()
    }
}
