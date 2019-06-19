//
//  LandmarkItemViewModel.swift
//  SwiftUIExample
//
//  Created by 이광용 on 2019/06/12.
//  Copyright © 2019 GwangYongLee. All rights reserved.
//

import SwiftUI
import Combine
import CoreLocation

final class LandmarkItemViewModel: Identifiable {
    private (set) var landmark: Landmark
    var id: Int {
        return landmark.id
    }
    var coordinate: CLLocationCoordinate2D {
        return landmark.locationCoordinate
    }
    var imageName: String {
        return landmark.imageName
    }
    var name: String {
        return landmark.name
    }
    var isFavorite: Bool {
        return landmark.isFavorite
    }
    var park: String {
        return landmark.park
    }
    var state: String {
        landmark.state
    }
    var toggleFavorite: ((Landmark) -> ())?
    var removeLandmark: ((Landmark) -> ())?
    init(landmark: Landmark,
         toggleFavorite: ((Landmark) -> ())? = nil,
         removeLandmark: ((Landmark) -> ())? = nil) {
        self.landmark = landmark
        self.toggleFavorite = toggleFavorite
        self.removeLandmark = removeLandmark
    }
    func preformToggleFavorite() {
        self.toggleFavorite?(landmark)
    }
}
