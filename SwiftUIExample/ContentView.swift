//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by 이광용 on 2019/06/11.
//  Copyright © 2019 GwangYongLee. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        Text("Hello World")
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
