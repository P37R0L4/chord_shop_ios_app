//
//  ContentView.swift
//  ChordShop
//
//  Created by Lucas Petrola on 31/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Divider()
            
            VStack {
                EmailLoginView()
                SocialMediasLoginView()
                Spacer()
                
                HStack {
                    Text("dont_have_account_yet")
                    NavigationLink("sign_up") {
                        SignUpView()
                    }
                }
                .font(.system(size: 14))
            }
            .padding()
            .navigationTitle("login_title_label")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // MARK: Languages Preview
        ContentView()
            .environment(\.locale, .init(identifier: "pt"))
        
        ContentView()
            .environment(\.locale, .init(identifier: "en"))
        
        // MARK: Dark preview
        ContentView().preferredColorScheme(.dark)
    }
}
