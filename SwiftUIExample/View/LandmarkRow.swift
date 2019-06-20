//
//  LandMarkRow.swift
//  SwiftUIExample
//
//  Created by 이광용 on 2019/06/12.
//  Copyright © 2019 GwangYongLee. All rights reserved.
//

import SwiftUI

struct LandmarkRow : View {
    @Environment(\.colorScheme)
    var colorScheme: ColorScheme
    var viewModel: LandmarkCellViewModel
    
    var body: some View {
        HStack {
            Image(viewModel.imageName)
                .resizable()
                .frame(width: 50, height: 50)
            Text(viewModel.name)
            Spacer()

            if viewModel.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(colorScheme == .light ? .yellow : .white)
            }
        }
    }
}

#if DEBUG
struct LandmarkRow_Previews : PreviewProvider {
    static var previews: some View {
        LandmarkRow(viewModel: LandmarkCellViewModel(landmark: mockLandmark,
                                                     repository: mockRepository))
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
#endif
