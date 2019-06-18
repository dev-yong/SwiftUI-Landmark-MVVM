//
//  CategoryHomeView.swift
//  SwiftUIExample
//
//  Created by 이광용 on 2019/06/17.
//  Copyright © 2019 GwangYongLee. All rights reserved.
//

import SwiftUI

struct CategoryHomeView : View {
    var categories = [String: [Landmark]].init(grouping: [mockLandmark],
                                               by: { $0.category.rawValue
    })
    var featuredLandmarks: [Landmark] {
        [mockLandmark].filter { $0.isFeatured }
    }
    var body: some View {
        NavigationView {
            List {
                FeaturedLandmarksView(landmarks: featuredLandmarks) 
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                ForEach(categories.keys.sorted().identified(by: \.self)) {
                    CategoryRow(categoryName: $0,
                                items: self.categories[$0] ?? [])
                }
                .listRowInsets(EdgeInsets())
                
                NavigationButton(destination: LandmarkList()) {
                    Text("See All")
                }
            }.navigationBarTitle(Text("Featured"))
        }
    }
}

#if DEBUG
struct CategoryHomeView_Previews : PreviewProvider {
    static var previews: some View {
        CategoryHomeView()
    }
}
#endif
