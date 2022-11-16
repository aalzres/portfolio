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
                    Text("tab_bar_map_title")
                    Image(systemName: "map")
                }
            ProfileView()
                .tabItem {
                    Text("tab_bar_profile_title")
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
