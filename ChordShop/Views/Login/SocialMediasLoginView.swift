//
//  SocialMediasLoginView.swift
//  ChordShop
//
//  Created by Lucas Petrola on 01/09/23.
//

import SwiftUI

struct SocialMediasLoginView: View {
    var body: some View {
        VStack {
            Text("or_sign_up_with")
            HStack {
                // MARK: Apple login Button
                Button {} label: {
                    Image(systemName: "apple.logo")
                        .foregroundColor(.white)
                }
                .frame(width: 60, height: 60)
                .background(.black)
                .cornerRadius(50)
                
                // MARK: Google Login Button
                Button {} label: {
                    Image("google.logo")
                }
                .frame(width: 60, height: 60)
                .cornerRadius(50)
                .overlay {
                    Circle().stroke(
                        LinearGradient(
                            colors: [
                                .pink,
                                .blue
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                }
            }
        }
    }
}

struct SocialMediasLoginView_Previews: PreviewProvider {
    static var previews: some View {
        SocialMediasLoginView()
    }
}
