//
//  ContentView.swift
//  FindMe
//
//  Created by Ming Bian on 3/18/25.
//

import SwiftUI

struct ContentView: View {
    private let locationManager = LocationManager.shared
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            locationManager.requestPerms()
        }
    }
}

#Preview {
    ContentView()
}
