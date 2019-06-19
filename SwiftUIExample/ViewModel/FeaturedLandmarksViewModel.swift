//
//  FeaturedLandmarksViewModel.swift
//  SwiftUIExample
//
//  Created by 이광용 on 2019/06/18.
//  Copyright © 2019 GwangYongLee. All rights reserved.
//

import SwiftUI
import Combine

final class FeaturedLandmarksViewModel {
    private let landmarks: [Landmark]
    var itemViewModels: [LandmarkItemViewModel] {
        return landmarks.map { LandmarkItemViewModel(landmark: $0) }
    }
    init(landmarks: [Landmark]) {
        self.landmarks = landmarks
    }
}
