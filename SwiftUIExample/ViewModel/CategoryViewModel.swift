//
//  CategoryViewModel.swift
//  SwiftUIExample
//
//  Created by 이광용 on 2019/06/18.
//  Copyright © 2019 GwangYongLee. All rights reserved.
//

import SwiftUI
import Combine

final class CategoryViewModel: BindableObject {
    let didChange = PassthroughSubject<CategoryViewModel, Never>()
    
    @UserDefault(key: "Landmarks",
                 default: JSONReader().load("Landmark"))
    private var landmarks: [Landmark]  {
        didSet {
            didChange.send(self)
        }
    }
    private var cancellables: [Cancellable] = []
    lazy var toggleFavorite: (Landmark) -> () = { [weak self] landmark in
        guard let index = self?.landmarks.firstIndex(where: {
            $0.id == landmark.id
        }) else {
            return
        }
        self?.landmarks[index].isFavorite.toggle()
    }
    lazy var removeLandmark: (Landmark) -> () = { [weak self] landmark in
        self?.landmarks.removeAll { $0.id == landmark.id }
    }
    init() {
        let didChangeCancellable = didChange.map { viewModel -> (FeaturedLandmarksViewModel, [CategoryRowViewModel], LandmarkListViewModel) in
            let featuredLandmarksViewModel = FeaturedLandmarksViewModel(landmarks: viewModel.featuredLandmarks)
            let categoryRowViewModels = viewModel.landmarkDictionary.map {
                CategoryRowViewModel(categoryName: $0.key, landmarks: $0.value)
                }.sorted { $0.id < $1.id }
            let landmarkListViewModel = LandmarkListViewModel(landmarks: viewModel.landmarks,
                                                              toggleFavorite: self.toggleFavorite,
                                                              removeLandmark: self.removeLandmark)
            return (featuredLandmarksViewModel, categoryRowViewModels, landmarkListViewModel)
            }.sink {
                self.featuredLandmarksViewModel = $0.0
                self.categoryRowViewModels = $0.1
                self.landmarkListViewModel = $0.2
        }
        cancellables.append(didChangeCancellable)
        didChange.send(self)
    }
    private var featuredLandmarks: [Landmark] {
        self.landmarks.filter { $0.isFeatured }
    }
    private var landmarkDictionary: [String: [Landmark]] {
        return [String: [Landmark]](grouping: landmarks) {
            $0.category.rawValue
        }
    }
    var featuredLandmarksViewModel: FeaturedLandmarksViewModel!
    
    var categoryRowViewModels: [CategoryRowViewModel] = []
    
    var landmarkListViewModel: LandmarkListViewModel!
}
