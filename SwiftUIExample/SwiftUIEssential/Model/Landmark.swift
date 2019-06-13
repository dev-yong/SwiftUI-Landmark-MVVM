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

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var imageName: String
    fileprivate var coordinates: Coordinates
    var state: String
    var park: String
    var category: Category
    var isFavorite: Bool
    var isFeatured: Bool
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
}

let mockLandmark = Landmark(id: 1001,
                            name: "Turtle Rock",
                            imageName: "turtlerock",
                            coordinates: Coordinates(latitude: -116.166868,
                                                     longitude: 34.011286),
                            state: "California",
                            park: "Joshua Tree National Park",
                            category: .rivers,
                            isFavorite: true,
                            isFeatured: true)
