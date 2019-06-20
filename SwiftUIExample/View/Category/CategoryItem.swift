//
//  CategoryItem.swift
//  SwiftUIExample
//
//  Created by 이광용 on 2019/06/17.
//  Copyright © 2019 GwangYongLee. All rights reserved.
//

import SwiftUI

struct CategoryItem : View {
    var viewModel: LandmarkCellViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(viewModel.imageName)
                .resizable()
                .renderingMode(.original)
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(viewModel.name)
                .color(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

#if DEBUG
struct CategoryItem_Previews : PreviewProvider {
    static var previews: some View {
        CategoryItem(viewModel: LandmarkCellViewModel(landmark: mockLandmark,
                                                        repository: mockRepository))
            .previewLayout(.fixed(width: 200, height: 200))
    }
}
#endif
