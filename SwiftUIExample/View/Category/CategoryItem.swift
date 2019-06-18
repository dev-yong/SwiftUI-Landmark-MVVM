//
//  CategoryItem.swift
//  SwiftUIExample
//
//  Created by 이광용 on 2019/06/17.
//  Copyright © 2019 GwangYongLee. All rights reserved.
//

import SwiftUI

struct CategoryItem : View {
    var landmark: Landmark
    var body: some View {
        VStack(alignment: .leading) {
            Image(landmark.imageName)
                .resizable()
                .renderingMode(.original)
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .color(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

#if DEBUG
struct CategoryItem_Previews : PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: mockLandmark)
            .previewLayout(.fixed(width: 200, height: 200))
    }
}
#endif
