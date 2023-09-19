//
//  ProspectView.swift
//  ChordShop
//
//  Created by Lucas Petrola on 19/09/23.
//

import SwiftUI

struct ProspectView: View {
    enum Filtertype {
        case home, chat, settings
    }
    
    var filter: Filtertype
    
    var body: some View {
        NavigationView {
            Text("Hee: 8==D")
                .navigationTitle(NSLocalizedString(title, comment: ""))
        }
    }
    
    var title: String {
        switch filter {
        case .home:
            return "home"
        case .chat:
            return "chat"
        case .settings:
            return "settings"
        }
    }
}

struct ProspectView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectView(filter: .home)
    }
}
