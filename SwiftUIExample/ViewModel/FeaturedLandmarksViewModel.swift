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
    private weak var repository: Repository<Landmark>!
    var itemViewModels: [LandmarkDetailViewModel] {
        return landmarks.map {
            LandmarkDetailViewModel(landmark: $0,
                                    repository: self.repository) }
    }
    init(landmarks: [Landmark],
         repository: Repository<Landmark>) {
        self.landmarks = landmarks
        self.repository = repository
    }
}
