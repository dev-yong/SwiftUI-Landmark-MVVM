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
    
    @UserDefault(key: "Landmarks", default: JSONReader().load("Landmark"))
    private var landmarks: [Landmark] {
        didSet {
            self.didChange.send(self)
        }
    }
    
    private var landmark: Landmark?
    
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
    init(landmark: Landmark) {
        let didChangeStream = didChange.map {
            $0.landmarks.first { $0.id == landmark.id }
        }.assign(to: \.landmark, on: self)
        cancellables.append(didChangeStream)
        didChange.send(self)
    }
    func preformToggleFavorite() {
        guard let landmark = self.landmark else { return }
        guard let index = landmarks.firstIndex(of: landmark) else { return }
        landmarks[index].isFavorite.toggle()
    }
}
