//
//  ListsTableViewDataSource.swift
//  MindMap
//
//  Created by Jeff on 8/27/16.
//  Copyright © 2016 Jeff Small. All rights reserved.
//

import Foundation
import UIKit

enum TableViewCellIdentifiers: String {
    case listTableViewCell
}

class ListsTableViewDataSource: NSObject, UITableViewDataSource {

    var lists: [List] = ListStore.store.lists
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard lists.count > 0 else {
            return 1
        }
        
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard lists.count > 0 else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "noListsTableViewCell") {
                return cell
            }
            
            return UITableViewCell()
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.listTableViewCell.rawValue) as? ListTableViewCell else {
            return UITableViewCell()
        }
        cell.titleLabel.text = lists[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

class ListsTableViewDelegate: NSObject, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row \(indexPath.row) selected.")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let dataSource = tableView.dataSource as? ListsTableViewDataSource,
            dataSource.lists.count > 0 else
        {
            return CGFloat(150)
        }
        
        return CGFloat(44.0)
    }
}
