//
//  SignUpView.swift
//  ChordShop
//
//  Created by Lucas Petrola on 01/09/23.
//

import SwiftUI

extension URL: Identifiable {
    public var id: String {
        self.absoluteString
    }
}

struct SignUpView: View {
    
    @State var presentURL: URL?

    var body: some View {
        NavigationStack {
            Divider()
            
            VStack {
                EmailSignUpFormView()
                Spacer()
                
                // MARK: Safari Terms
                Button("terms_and_conditions") {
                    presentURL = URL(string: "https://google.com")!
                    }
                    .sheet(item: $presentURL) { url in
                            SafariView(url: url)
                    }
            }
            .padding()
            .navigationTitle("sign_up")
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
