//
//  FeaturedLandmarksView.swift
//  SwiftUIExample
//
//  Created by 이광용 on 2019/06/17.
//  Copyright © 2019 GwangYongLee. All rights reserved.
//

import SwiftUI

struct FeaturedLandmarksView : View {
    var landmarks: [Landmark]
    var body: some View {
        Image(landmarks[0].imageName)
            .resizable()
//            .frame(height: 250)
    }
}

#if DEBUG
struct FeaturedLandmarksView_Previews : PreviewProvider {
    static var previews: some View {
        FeaturedLandmarksView(landmarks: [mockLandmark])
    }
}
#endif
