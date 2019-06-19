//
//  CategoryRowViewModel.swift
//  SwiftUIExample
//
//  Created by 이광용 on 2019/06/18.
//  Copyright © 2019 GwangYongLee. All rights reserved.
//
import SwiftUI
import Combine

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
