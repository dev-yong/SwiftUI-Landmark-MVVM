//
//  Repository.swift
//  SwiftUIExample
//
//  Created by United Merchant Services.inc on 6/20/19.
//  Copyright © 2019 GwangYongLee. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

let mockRepository = Repository<Landmark>(key: "Landmark", default: JSONReader().load("Landmark"))

class Repository<Item: Codable & Equatable & Identifiable> {
    private var _itemsSubject = CurrentValueSubject<[Item], Never>([])
    
    private var _items: [Item] {
        get {
            return _itemsSubject.value
        }
        set {
            _itemsSubject.value = newValue
        }
    }

    func items() -> AnyPublisher<[Item], Never> {
        return _itemsSubject.eraseToAnyPublisher()
    }
    
    init(key: String, default: [Item]) {
        _items = `default`
    }
    func add(item: Item) {
        _items.append(item)
    }
    func delete(item: Item) {
        _items.removeAll { $0 == item }
    }
    func update(item: Item) {
        guard let index = _items.firstIndex(where: { (_item) -> Bool in
            return _item.id == item.id
        }) else { return }
        _items[index] = item
    }
}
