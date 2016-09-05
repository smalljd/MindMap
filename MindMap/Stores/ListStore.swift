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
    func add(list: List)
    func remove(list: List)
    func save()
}

protocol ListRetrievable {
    func list(withTitle: String)
    func lists() -> [List]
}

struct ListStore: ListStoreType {
    var lists = [List]()
    static let store = ListStore()
    private init() {}
}
