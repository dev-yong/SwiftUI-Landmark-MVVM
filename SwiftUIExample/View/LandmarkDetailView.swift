//
//  LandmarkDetailView.swift
//  SwiftUIExample
//
//  Created by 이광용 on 2019/06/11.
//  Copyright © 2019 GwangYongLee. All rights reserved.
//

import SwiftUI

struct LandmarkDetailView: View {
    @ObjectBinding
    var viewModel: LandmarkDetailViewModel
    
    var body: some View {
        VStack {
            MapView(coordinate: viewModel.coordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImage(image: Image(viewModel.imageName),
                        size: 250)
                .relativeSize(width: 150, height: 150)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(viewModel.name)
                        .font(.title)
                    Button(action: {
                        self.viewModel.preformToggleFavorite()
                    }) {
                        if viewModel.isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                HStack {
                    Text(viewModel.park)
                        .font(.subheadline)
                    Spacer()
                    Text(viewModel.state)
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
        return LandmarkDetailView(viewModel: LandmarkDetailViewModel(landmark: mockLandmark,
                                                                     repository: mockRepository))
    }
}
#endif
