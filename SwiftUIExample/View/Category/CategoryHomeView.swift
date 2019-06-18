//
//  CategoryHomeView.swift
//  SwiftUIExample
//
//  Created by 이광용 on 2019/06/17.
//  Copyright © 2019 GwangYongLee. All rights reserved.
//

import SwiftUI

struct CategoryHomeView : View {
    @ObjectBinding var viewModel: CategoryViewModel
    var body: some View {
        NavigationView {
            List {
                FeaturedLandmarksView(viewModel: viewModel.featuredLandmarksViewModel)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                ForEach(viewModel.categoryRowViewModel) {
                    CategoryRow(viewModel: $0)
                }
                .listRowInsets(EdgeInsets())
                NavigationButton(destination: ContentView(viewModel: viewModel.landmarkListViewModel)) {
                    Text("See All")
                }
            }.navigationBarTitle(Text("Featured"))
        }
    }
}

#if DEBUG
struct CategoryHomeView_Previews : PreviewProvider {
    static var previews: some View {
        CategoryHomeView(viewModel: CategoryViewModel())
    }
}
#endif
