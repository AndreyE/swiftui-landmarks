//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Andrey Lizunov on 2/8/21.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
        
        // ["iPhone XS Max", "iPhone SE (2nd generation)", "iPad Pro (12.9-inch) (2nd generation)"]
        //ForEach(["iPhone XS Max"], id: \.self) { deviceName in
        //    LandmarkList()
        //        .previewDevice(PreviewDevice(rawValue: deviceName))
        //        .previewDisplayName(deviceName)
        //}
    }
}
