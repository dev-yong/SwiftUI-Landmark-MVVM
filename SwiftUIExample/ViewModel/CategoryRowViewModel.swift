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
    private weak var repository: Repository<Landmark>!

    let categoryName: String
    var itemViewModels: [LandmarkCellViewModel] {
        return landmarks.map {
            LandmarkCellViewModel(landmark: $0,
                                  repository: self.repository)
            
        }
    }
    init(categoryName: String,
         landmarks: [Landmark],
         repository: Repository<Landmark>) {
        self.categoryName = categoryName
        self.landmarks = landmarks
        self.repository = repository
    }
}
