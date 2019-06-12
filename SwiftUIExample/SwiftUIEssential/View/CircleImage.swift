//
//  CircleImage.swift
//  SwiftUIExample
//
//  Created by 이광용 on 2019/06/11.
//  Copyright © 2019 GwangYongLee. All rights reserved.
//

import SwiftUI

struct CircleImage : View {
    var image: Image
    var size: CGFloat = 150
    var body: some View {
        image
            .resizable()
            .frame(width: size, height: size)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white,
                                     lineWidth: 4))
            .shadow(radius: 10)
    }
}

#if DEBUG
struct CircleImage_Previews : PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image(landmarks[1].imageName))
    }
}
#endif
