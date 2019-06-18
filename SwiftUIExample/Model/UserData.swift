//
//  UserData.swift
//  SwiftUIExample
//
//  Created by 이광용 on 2019/06/12.
//  Copyright © 2019 GwangYongLee. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: BindableObject  {
    let didChange = PassthroughSubject<UserData, Never>()
    
    var showFavoritesOnly = false {
        didSet {
            didChange.send(self)
        }
    }
    
    @UserDefault(key: "Landmarks",
                 default: JSONReader().load("Landmark"))
    var landmarks: [Landmark]  {
        didSet {
            didChange.send(self)
        }
    }
}

final class CategoryViewModel: BindableObject {
    let didChange = PassthroughSubject<CategoryViewModel, Never>()
    
    @UserDefault(key: "Landmarks",
                 default: JSONReader().load("Landmark"))
    private var landmarks: [Landmark]  {
        didSet {
            didChange.send(self)
        }
    }
    private var featuredLandmarks: [Landmark] {
        self.landmarks.filter { $0.isFeatured }
    }
    private var landmarkDictionary: [String: [Landmark]] {
        return [String: [Landmark]].init(grouping: landmarks) {
            $0.category.rawValue
        }
    }
    var featuredLandmarksViewModel: FeaturedLandmarksViewModel {
        return FeaturedLandmarksViewModel(landmarks: featuredLandmarks)
    }
    var categoryRowViewModel: [CategoryRowViewModel] {
        return landmarkDictionary.map {
            CategoryRowViewModel(categoryName: $0.key, landmarks: $0.value)
        }.sorted { $0.id < $1.id }
    }
    var landmarkListViewModel: LandmarkListViewModel {
        return LandmarkListViewModel(landmarks: landmarks)
    }
}

final class FeaturedLandmarksViewModel {
    private let landmarks: [Landmark]
    var itemViewModels: [LandmarkItemViewModel] {
        return landmarks.map { LandmarkItemViewModel(landmark: $0) }
    }
    init(landmarks: [Landmark]) {
        self.landmarks = landmarks
    }
}

final class CategoryRowViewModel: Identifiable {
    var id: String {
        return categoryName
    }
    private let landmarks: [Landmark]
    let categoryName: String
    var itemViewModels: [LandmarkItemViewModel] {
        return landmarks.map { LandmarkItemViewModel(landmark: $0) }
    }
    init(categoryName: String,
         landmarks: [Landmark]) {
        self.categoryName = categoryName
        self.landmarks = landmarks
    }
}

final class LandmarkListViewModel: BindableObject {
    var didChange = PassthroughSubject<LandmarkListViewModel, Never>()
    
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
    var itemViewModels: [LandmarkItemViewModel] = []
    
    private var cancellabel: [Cancellable] = []
    init(landmarks: [Landmark]) {
        self.landmarks = landmarks
        let landmarkRowViewModelsCancellabel = didChange.map { vm in
            vm.landmarks.filter {
                $0.isFavorite == vm.showFavoritesOnly || $0.isFavorite == true
            }
            .map { LandmarkItemViewModel(landmark: $0) }
        }.assign(to: \.itemViewModels, on: self)
        cancellabel.append(landmarkRowViewModelsCancellabel)
        didChange.send(self)
    }
}

import CoreLocation
final class LandmarkItemViewModel: Identifiable {
    private var landmark: Landmark
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
    init(landmark: Landmark) {
        self.landmark = landmark
    }
}


