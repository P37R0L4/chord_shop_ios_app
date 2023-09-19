//
//  BodySettingsView.swift
//  ChordShop
//
//  Created by Lucas Petrola on 19/09/23.
//

import SwiftUI

struct BodySettingsView: View {
    var body: some View {
        List {
            ForEach(0..<5) {_ in
                Text("settings")
            }
        }
        .navigationTitle("settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BodySettingsView_Previews: PreviewProvider {
    static var previews: some View {
        BodySettingsView()
    }
}
