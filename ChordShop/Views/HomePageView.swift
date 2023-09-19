//
//  HomePageView.swift
//  ChordShop
//
//  Created by Lucas Petrola on 18/09/23.
//

import SwiftUI

struct HomePageView: View {
    @State private var activeTabIndex: Int = 0
    
    var body: some View {
        TabView(selection: $activeTabIndex) {
            Group {
                ProspectView(filter: .home)
                    .tag(0)
                    .tabItem {
                        Label("home", systemImage: "house")
                    }
                
                ProspectView(filter: .chat)
                    .tag(1)
                    .tabItem {
                        Label("chat", systemImage: "text.bubble")
                    }
                
                ProspectView(filter: .settings)
                    .tag(2)
                    .tabItem {
                        Label("settings", systemImage: "gear")
                    }
            }
            .toolbar(.hidden, for: .navigationBar)
        }
        .accentColor(.pink)
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
