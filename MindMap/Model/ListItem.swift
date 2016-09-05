//
//  ListItem.swift
//  MindMap
//
//  Created by Jeff on 8/27/16.
//  Copyright © 2016 Jeff Small. All rights reserved.
//

import Foundation

protocol ListItemIdentifiable {
    var dateAdded: Date { get }
    var dateUpdated: Date { get set }
    func content(contains: String) -> Bool
}

protocol ListItemDisplayable {
    var contents: String { get set }
    func beginningIndicator() -> String
}

extension ListItemDisplayable {
    func beginningIndicator() -> String {
        return "●"
    }
}

struct ListItem: ListItemDisplayable {
    var contents: String
}


//extension ListItemIdentifiable {
//    func listItem(_ listItem: ListItem) -> Bool {
//        
//    }
//}
