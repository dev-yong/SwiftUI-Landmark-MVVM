//
//  LandmarkCellViewModel.swift
//  SwiftUIExample
//
//  Created by United Merchant Services.inc on 6/20/19.
//  Copyright © 2019 GwangYongLee. All rights reserved.
//

import Foundation
import SwiftUI
final class LandmarkCellViewModel: Identifiable {
    private weak var repository: Repository<Landmark>!
    private var landmark: Landmark
    var detailViewModel: LandmarkDetailViewModel
    init(landmark: Landmark,
         repository: Repository<Landmark>) {
        self.landmark = landmark
        self.repository = repository
        detailViewModel = LandmarkDetailViewModel(landmark: landmark,
                                                  repository: repository)
    }
    
    var id: Int {
        return landmark.id
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
}
