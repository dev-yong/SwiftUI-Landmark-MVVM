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

final class LandmarkViewModel: BindableObject {
    let didChange = PassthroughSubject<LandmarkViewModel, Never>()
    
    @Published
    var showFavoritesOnly = false
    
    @UserDefault(key: "Landmarks",
                 default: JSONReader().load("Landmark"))
    var landmarks: [Landmark]  {
        didSet {
            didChange.send(self)
        }
    }
}
