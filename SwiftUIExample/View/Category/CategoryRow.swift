//
//  CategoryRow.swift
//  SwiftUIExample
//
//  Created by 이광용 on 2019/06/17.
//  Copyright © 2019 GwangYongLee. All rights reserved.
//

import SwiftUI

struct CategoryRow : View {
    var viewModel: CategoryRowViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(showsHorizontalIndicator: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(viewModel.itemViewModels) { itemViewModel in
                        NavigationButton(destination: LandmarkDetailView(viewModel: itemViewModel.detailViewModel)) {
                            CategoryItem(viewModel: itemViewModel)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}


#if DEBUG
struct CategoryRow_Previews : PreviewProvider {
    static var previews: some View {
        CategoryRow(viewModel: CategoryRowViewModel(categoryName: mockLandmark.category.rawValue,
                                                    landmarks: [mockLandmark],
                                                    repository: mockRepository))
    }
}
#endif
