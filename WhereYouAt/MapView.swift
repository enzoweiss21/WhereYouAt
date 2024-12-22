//
//  MapView.swift
//  WhereYouAt
//
//  Created by Enzo Weiss on 12/22/24.
//
import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), // Example location (San Francisco)
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @State private var places: [Place] = [
        Place(name: "Club A", coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)),
        Place(name: "Bar B", coordinate: CLLocationCoordinate2D(latitude: 37.7849, longitude: -122.4094))
    ]
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: places) { place in
            MapAnnotation(coordinate: place.coordinate) {
                VStack {
                    Text(place.name).font(.caption).bold()
                    Image(systemName: "mappin.circle.fill")
                        .foregroundColor(.red)
                        .font(.largeTitle)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

