//
//  ContentView.swift
//  Landmarks
//
//  Created by Harsha Agarwal on 24/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView().environment(ModelData())
}

