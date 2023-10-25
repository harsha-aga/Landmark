//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Harsha Agarwal on 25/10/23.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = true

    var filteredLanmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (landmark.isFavorite || !showFavoritesOnly)
        }
    }

    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly, label: {
                    Text("Fav only")
                })
            ForEach(filteredLanmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    HStack {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
        }
            .navigationTitle("Landmarks")
        } detail: {
            Toggle("ABC", isOn: $showFavoritesOnly).padding(.all)
            Spacer()
        }
    }
}

#Preview {
    LandmarkList().environment(ModelData())
}
