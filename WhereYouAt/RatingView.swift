//
//  RatingView.swift
//  WhereYouAt
//
//  Created by Enzo Weiss on 12/22/24.
//

import SwiftUI

struct RatingView: View {
    @State private var musicRating = 4.5
    @State private var atmosphereRating = 4.0
    @State private var workersRating = 3.5
    
    var body: some View {
        VStack {
            Text("Ratings")
                .font(.headline)
            HStack {
                Text("Music:")
                Text(String(format: "%.1f", musicRating))
            }
            HStack {
                Text("Atmosphere:")
                Text(String(format: "%.1f", atmosphereRating))
            }
            HStack {
                Text("Workers:")
                Text(String(format: "%.1f", workersRating))
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .shadow(radius: 5)
    }
}
