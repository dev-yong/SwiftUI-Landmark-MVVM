//
//  LandmarkDetailView.swift
//  SwiftUIExample
//
//  Created by 이광용 on 2019/06/11.
//  Copyright © 2019 GwangYongLee. All rights reserved.
//

import SwiftUI

struct LandmarkDetailView: View {
    var landmark: Landmark
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImage(image: Image(landmark.imageName),
                        size: 250)
                .relativeSize(width: 150, height: 150)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.headline)
                }
            }
            .padding()
            Spacer()
        }
    }
}

#if DEBUG
struct LandmarkDetailView_Previews : PreviewProvider {
    static var previews: some View {
        LandmarkDetailView(landmark: landmarks[1])
    }
}
#endif
