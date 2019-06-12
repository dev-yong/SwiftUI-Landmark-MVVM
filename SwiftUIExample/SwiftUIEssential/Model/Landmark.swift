//
//  Landmark.swift
//  SwiftUIExample
//
//  Created by 이광용 on 2019/06/11.
//  Copyright © 2019 GwangYongLee. All rights reserved.
//

import Foundation
import SwiftUI
import CoreLocation

let landmarks: [Landmark] = JSONReader().load("Landmark")

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var imageName: String
    fileprivate var coordinates: Coordinates
    var state: String
    var park: String
    var category: Category
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
    }
}

