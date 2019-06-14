//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by United Merchant Services.inc on 6/14/19.
//  Copyright © 2019 GwangYongLee. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @EnvironmentObject
    private var theme: Theme
    var body: some View {
        LandmarkList()
            .colorScheme(theme.colorScheme)
    }

}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserData())
            .environmentObject(Theme())
    }
}
#endif
