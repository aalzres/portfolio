//
//  FinderLostTabBar.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 16/11/22.
//

import SwiftUI

struct FinderLostTabBar: View {
    var body: some View {
        TabView() {
            MapView()
                .tabItem {
                    Text("Map View")
                    Image(systemName: "map")
                }
            UserView()
                .tabItem {
                    Text("User View")
                    Image(systemName: "person")
                }
        }
    }
}

struct FinderLostTabBar_Previews: PreviewProvider {
    static var previews: some View {
        FinderLostTabBar()
    }
}
