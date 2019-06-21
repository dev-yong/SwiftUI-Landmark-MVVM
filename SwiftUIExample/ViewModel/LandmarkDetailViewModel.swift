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

final class LandmarkDetailViewModel: BindableObject {
    var didChange = PassthroughSubject<LandmarkDetailViewModel, Never>()
    private weak var repository: Repository<Landmark>!
    
    private var landmark: Landmark? {
        didSet {
            didChange.send(self)
        }
    }
    
    var coordinate: CLLocationCoordinate2D {
        return landmark?.locationCoordinate ?? CLLocationCoordinate2D(latitude: 0, longitude: 0)
    }
    var imageName: String {
        return landmark?.imageName ?? "turtlerock"
    }
    var name: String {
        return landmark?.name ?? ""
    }
    var isFavorite: Bool {
        return landmark?.isFavorite ?? false
    }
    var park: String {
        return landmark?.park ?? ""
    }
    var state: String {
        landmark?.state ?? ""
    }
    private var cancellables: [Cancellable] = []

    init(landmark: Landmark,
         repository: Repository<Landmark>) {
        self.repository = repository
        let stream = repository.items()
            .map {
                $0.first { $0.id == landmark.id }
            }
            .assign(to: \.landmark, on: self)
        cancellables.append(stream)
    }
    func preformToggleFavorite() {
        guard var landmark = landmark else { return }
        landmark.isFavorite.toggle()
        repository.update(item: landmark)
    }
}
