//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Andrey Lizunov on 2/7/21.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
