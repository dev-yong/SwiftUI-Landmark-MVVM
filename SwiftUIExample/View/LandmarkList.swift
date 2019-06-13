//
//  LandmarkList.swift
//  SwiftUIExample
//
//  Created by 이광용 on 2019/06/12.
//  Copyright © 2019 GwangYongLee. All rights reserved.
//

import SwiftUI

struct LandmarkList : View {
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(userData.landmarks) { landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationButton(destination: LandmarkDetailView(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }.onDelete {
                        self.deleteLandmark(indexSet: $0)
                }
            }.navigationBarTitle(Text("Landmarks"))
        }
    }
    private func deleteLandmark(indexSet: IndexSet) {
        indexSet.forEach {
            userData.landmarks.remove(at: $0)
        }
    }
}

#if DEBUG
struct LandmarkList_Previews : PreviewProvider {
    static var previews: some View {
        return LandmarkList()
            .environmentObject(UserData())
        //        ForEach(["iPhone SE", "iPhone XS Max"].identified(by: \.self)) { deviceName in
        //            LandmarkList()
        //                .previewDevice(PreviewDevice(rawValue: deviceName))
        //                .previewDisplayName(deviceName)
        //        }
    }
}
#endif
