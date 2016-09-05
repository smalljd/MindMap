//
//  List.swift
//  MindMap
//
//  Created by Jeff on 8/27/16.
//  Copyright © 2016 Jeff Small. All rights reserved.
//

import Foundation

protocol ListIdentifiable {
    var dateAdded: Date { get }
    var dateUpdated: Date { get set }
    var title: String { get set }
}

struct List: ListIdentifiable {
    let dateAdded: Date
    var dateUpdated: Date
    var title: String
    var listItems = [ListItem]()
    
    init(title: String) {
        self.dateAdded = Date()
        self.dateUpdated = dateAdded
        self.title = title
    }
}
