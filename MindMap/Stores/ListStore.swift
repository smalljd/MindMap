//
//  ListStore.swift
//  MindMap
//
//  Created by Jeff on 8/27/16.
//  Copyright © 2016 Jeff Small. All rights reserved.
//

import Foundation

protocol ListStoreType {
    var lists: [List] { get set }
}

protocol ListStoreUpdatable {
    mutating func add(list: List)
    mutating func remove(list: List)
}

extension ListStore: ListStoreUpdatable {
    mutating func remove(list: List) {
        for (index, listValue) in lists.enumerated() where list.dateAdded == listValue.dateAdded {
            lists.remove(at: index)
        }
        
        for observer in observers {
            observer.listsUpdated()
        }
    }

    mutating func add(list: List) {
        lists.append(list)
        for observer in observers {
            observer.listsUpdated()
        }
    }

}

protocol ListStoreObservable {
    func listsUpdated()
}

protocol ListRetrievable {
    func list(withTitle: String)
    func lists() -> [List]
}

struct ListStore: ListStoreType {
    var lists = [List]()
    var observers = [ListStoreObservable]()
    static var store = ListStore()
    private init() {}
}
