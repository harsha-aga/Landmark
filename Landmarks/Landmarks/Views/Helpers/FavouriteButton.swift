//
//  FavouriteButton.swift
//  Landmarks
//
//  Created by Harsha Agarwal on 25/10/23.
//

import SwiftUI

struct FavouriteButton: View {
    //Binding - Delegate
    @Binding var isSet: Bool
    var body: some View {
        Button(action: {
            isSet.toggle()
        }, label: {
            Image(systemName: isSet ? "star.fill" : "star").resizable().frame(width: 18,height: 18).foregroundStyle(isSet ? .yellow : .gray)
        })
    }
}

#Preview {
    FavouriteButton(isSet: .constant(true))
}
