//
//  BarDetails.swift
//  WhereYouAt
//
//  Created by Enzo Weiss on 12/22/24.
//

import SwiftUI
import FirebaseFirestore

@main
struct BarApp: App {
    var body: some Scene {
        WindowGroup {
            BarListView() // Starting point of the app
        }
    }
}

struct BarListView: View {
    let bars = ["Club A", "Bar B", "Lounge C"]

    var body: some View {
        NavigationView {
            List(bars, id: \.self) { bar in
                NavigationLink(destination: BarDetailView(barName: bar)) {
                    Text(bar)
                }
            }
            .navigationTitle("Bars & Clubs")
        }
    }
}

struct BarDetailView: View {
    var barName: String
    @State private var isGoing = false

    var body: some View {
        VStack {
            Text(barName)
                .font(.largeTitle)
                .bold()
            
            Button(action: {
                isGoing.toggle()
                updateAttendance()
            }) {
                Text(isGoing ? "You're Going!" : "WYA?")
                    .font(.title2)
                    .padding()
                    .background(isGoing ? Color.green : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }

    func updateAttendance() {
        let db = Firestore.firestore()
        let barRef = db.collection("bars").document(barName)
        
        barRef.updateData([
            "attendees": FieldValue.increment(isGoing ? 1 : -1)
        ]) { error in
            if let error = error {
                print("Error updating attendance: \(error)")
            } else {
                print("Attendance updated successfully!")
            }
        }
    }
}

