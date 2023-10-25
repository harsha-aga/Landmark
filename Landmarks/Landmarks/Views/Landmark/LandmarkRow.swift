//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Harsha Agarwal on 25/10/23.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
                .frame(alignment: .leading)
            Spacer()
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            } else {
                Image(systemName: "star").foregroundStyle(.gray)
            }
        }.padding()
    }
}

#Preview("Turtle Rock") {
    let data = ModelData().landmarks
    return Group {
        LandmarkRow(landmark: data[0])
        LandmarkRow(landmark: data[1])
    }
}

