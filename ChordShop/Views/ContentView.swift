//
//  ContentView.swift
//  ChordShop
//
//  Created by Lucas Petrola on 31/08/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var pushToHome: Bool = false
    
    let authController = AuthController()
    
    var body: some View {
        NavigationStack {
            VStack {
                EmailLoginView()
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
            .onAppear {
                authController.handleUserLogged {
                    pushToHome = true
                }
            }
            
            // MARK: Navigations Widgets
            NavigationLink(destination: HomePageView(), isActive: $pushToHome) { EmptyView() }
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
