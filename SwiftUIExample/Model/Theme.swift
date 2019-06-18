//
//  Theme.swift
//  SwiftUIExample
//
//  Created by United Merchant Services.inc on 6/14/19.
//  Copyright © 2019 GwangYongLee. All rights reserved.
//

import SwiftUI
import Combine

extension ColorScheme: CustomStringConvertible {
    public var description: String {
        switch self {
        case .light: return "Light"
        case .dark: return "Dark"
        @unknown default:
            fatalError()
        }
    }
}

extension ColorScheme: Identifiable {
    public var id: String {
        self.description
    }
}

final class Theme: BindableObject {
    let didChange = PassthroughSubject<Theme, Never>()
    
    var colorScheme: ColorScheme {
        colorSchemes[selectedIndex]
    }
    
    let colorSchemes: [ColorScheme] = [.light, .dark]
    
    var selectedIndex = 0 {
        didSet {
            didChange.send(self)
        }
    }
}
