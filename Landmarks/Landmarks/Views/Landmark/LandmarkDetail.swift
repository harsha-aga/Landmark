//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Harsha Agarwal on 25/10/23.
//

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData

    var landmark: Landmark
    var landmarkIndex: Int? {
        modelData.landmarks.firstIndex(where: {landmark.id == $0.id}) ?? nil
    }

    var body: some View {
        @Bindable var modelData = modelData
        ScrollView {
            MapView(coordinate: landmark.locationCoordinates)
                .frame(height: 300)
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    if let landmarkIndex {
                        FavouriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                    }
                }
                HStack{
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }
                .foregroundColor(.gray)
                .font(.subheadline)
                Divider()
                Text("About \(landmark.name)")
                                    .font(.title2)
                Text(landmark.description).font(.caption)
            }
            .padding()
            Spacer()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let data = ModelData()
    return LandmarkDetail(landmark: data.landmarks[0]).environment(data)
}
