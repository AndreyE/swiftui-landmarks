//
//  CategoriesHome.swift
//  Landmarks
//
//  Created by Andrey Lizunov on 2/28/21.
//

import SwiftUI

struct CategoriesHome: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            List {
                if(!modelData.features.isEmpty) {
                    let landmark = modelData.features[0]
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        landmark.image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
                    }
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            .navigationTitle("Featured")
        }
    }
}

struct CategoriesHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesHome()
            .environmentObject(ModelData())
    }
}