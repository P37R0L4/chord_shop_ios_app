//
//  GradientButton.swift
//  ChordShop
//
//  Created by Lucas Petrola on 01/09/23.
//

import SwiftUI

struct GradientButtonView: View {
    
    var completion: () -> Void
    var title: String
    
    var body: some View {
        Button {
            completion()
        } label: {
            Text(LocalizedStringKey(title))
                .frame(maxWidth: .infinity)
                .padding(20)
                .foregroundColor(.white)
                .textCase(.uppercase)
        }
        .background(
            LinearGradient(
                colors: [
                    .pink,
                    .blue
                ],
                startPoint: .leading,
                endPoint: .trailing
            )
        )
        .cornerRadius(8)
        .padding(.vertical, 10)
    }
}

struct GradientButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GradientButtonView(completion: {}, title: "Button")
    }
}
