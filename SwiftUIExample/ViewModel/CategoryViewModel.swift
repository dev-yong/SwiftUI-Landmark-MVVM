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
    let didChange: AnyPublisher<Void, Never>
    
    private var repository: Repository<Landmark>!
    
    private var cancellables: [AnyCancellable] = []
    init() {
        repository = Repository(key: "Landmark", default: JSONReader().load("Landmark"))
        didChange = repository.items().map {
            _ in ()
        }.eraseToAnyPublisher()
        self.landmarkListViewModel = LandmarkListViewModel(repository: repository)
        let featuredLandmarksStream = repository.items().map {
            $0.filter { $0.isFeatured }
        }.assign(to: \.featuredLandmarks, on: self)
        let categoryRowViewModelStream = repository.items().map {
            return [String: [Landmark]](grouping: $0) {
                $0.category.rawValue
            }
        }.assign(to: \.categoryLandmarkDictionary, on: self)
        cancellables.append(contentsOf: [featuredLandmarksStream, categoryRowViewModelStream])
    }
    private var featuredLandmarks = [Landmark]()
    private var categoryLandmarkDictionary = [String: [Landmark]]()
    
    var featuredLandmarksViewModel: FeaturedLandmarksViewModel? {
        return FeaturedLandmarksViewModel(landmarks: featuredLandmarks,
                                          repository: repository)
    }
    var categoryRowViewModels: [CategoryRowViewModel] {
        categoryLandmarkDictionary.map {
            CategoryRowViewModel(categoryName: $0.key,
                                 landmarks: $0.value,
                                 repository: repository)
        }.sorted { $0.id < $1.id }
    }
    var landmarkListViewModel: LandmarkListViewModel
}
