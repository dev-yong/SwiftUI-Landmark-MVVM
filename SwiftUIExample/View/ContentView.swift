//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by United Merchant Services.inc on 6/14/19.
//  Copyright © 2019 GwangYongLee. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var viewModel: LandmarkListViewModel
    @EnvironmentObject
    private var theme: Theme
    var body: some View {
        LandmarkList(viewModel: viewModel)
            .colorScheme(theme.colorScheme)
    }

}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: LandmarkListViewModel(landmarks: [mockLandmark]))
            .environmentObject(Theme())
    }
}
#endif
