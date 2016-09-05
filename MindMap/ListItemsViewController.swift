//
//  DetailViewController.swift
//  MindMap
//
//  Created by Jeff on 8/27/16.
//  Copyright © 2016 Jeff Small. All rights reserved.
//

import UIKit

class ListItemsViewController: UIViewController {
    
    var dataSource = ListItemsTableViewDataSource()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        tableView.dataSource = dataSource
        tableView.tableFooterView = UIView()
    }
}

class ListItemsTableViewDataSource: NSObject, UITableViewDataSource {
    
    var list: List?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list?.listItems.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let list = list,
            let cell = tableView.dequeueReusableCell(withIdentifier: "listItemCell") as? ListItemTableViewCell else
        {
            return UITableViewCell()
        }
        
        let listItem = list.listItems[indexPath.row]
        cell.contentTextView.text = listItem.contents
        
        return cell
    }
    
}

