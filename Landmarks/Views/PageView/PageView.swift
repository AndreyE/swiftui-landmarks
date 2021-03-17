//
//  PageView.swift
//  Landmarks
//
//  Created by Andrey Lizunov on 3/15/21.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0

    var body: some View {
        VStack() {
            PageViewController(pages: pages, currentPage: $currentPage)
            Button("Current page \(currentPage)") {
                currentPage = currentPage + 1 < pages.count ? currentPage + 1 : 0
            }
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
            .aspectRatio(3/2, contentMode: .fit)
    }
}
