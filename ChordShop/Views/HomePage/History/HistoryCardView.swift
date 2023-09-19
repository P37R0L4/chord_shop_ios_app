//
//  HistoryCardView.swift
//  ChordShop
//
//  Created by Lucas Petrola on 18/09/23.
//

import SwiftUI

struct HistoryCardView: View {
    
    var sourceImage: String = ""
    
    var body: some View {
        if sourceImage.isEmpty {
            Circle()
                .stroke(.pink, lineWidth: 8)
        } else {
            Image(sourceImage)
                .frame(width: 50)
        }
    }
}

struct HistoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryCardView()
    }
}
