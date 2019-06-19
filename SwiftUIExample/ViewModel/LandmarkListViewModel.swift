//
//  LandmarkListViewModel.swift
//  SwiftUIExample
//
//  Created by 이광용 on 2019/06/18.
//  Copyright © 2019 GwangYongLee. All rights reserved.
//

import SwiftUI
import Combine

final class LandmarkListViewModel: BindableObject {
    var didChange = PassthroughSubject<LandmarkListViewModel, Never>()
    var toggleFavorite: ((Landmark) -> ())?
    var removeLandmark: ((Landmark) -> ())?
    var showFavoritesOnly: Bool = false {
        didSet {
            didChange.send(self)
        }
    }
    private var landmarks: [Landmark] {
        didSet {
            didChange.send(self)
        }
    }
    var itemViewModels: [LandmarkItemViewModel] = [] {
        didSet {
            print(itemViewModels.count)
        }
    }
    
    private var cancellabel: [Cancellable] = []
    init(landmarks: [Landmark],
         toggleFavorite: ((Landmark) -> ())? = nil,
         removeLandmark: ((Landmark) -> ())? = nil) {
        self.landmarks = landmarks
        self.toggleFavorite = toggleFavorite
        self.removeLandmark = removeLandmark
        let landmarkRowViewModelsCancellabel = didChange.map { viewModel in
            viewModel.landmarks.filter {
                viewModel.showFavoritesOnly == $0.isFavorite || $0.isFavorite
                }
                .map {
                    LandmarkItemViewModel(landmark: $0,
                                          toggleFavorite: self.toggleFavorite,
                                          removeLandmark: self.removeLandmark)
            }
        }.assign(to: \.itemViewModels, on: self)
        cancellabel.append(landmarkRowViewModelsCancellabel)
        didChange.send(self)
    }
    func preformRemoveLandmark(indexes: [Int]) {
        indexes.forEach {
            self.removeLandmark?(itemViewModels[$0].landmark)
        }
    }
}
