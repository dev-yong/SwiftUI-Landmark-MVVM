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

class Repository<Item: Codable & Equatable>: BindableObject {
    var didChange = CurrentValueSubject<[Item], Never>([])

    @UserDefault
    var items: [Item] {
        didSet {
            didChange.send(items)
        }
    }
    
    init(key: String, default: [Item]) {
        $items = UserDefault(key: key, default: `default`)
    }
    func add(item: Item) {
        items.append(item)
    }
    func delete(item: Item) {
        items.removeAll { $0 == item }
    }
    func update(item: Item) {
        guard let index = items.firstIndex(of: item) else { return }
        items[index] = item
    }
}
