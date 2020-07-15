//
//  ContentView.swift
//  NaNoGo
//
//  Created by Lizz Clark on 14/07/2020.
//

import SwiftUI

struct ContentView: View {
    @SceneStorage("ContentView.text") private var text = ""
    
    var body: some View {
        NavigationView {
            TextEditor(text: $text)
                .foregroundColor(.black)
                .background(Color(red: 0.9, green: 0.9, blue: 1))
                .navigationTitle("Start writing...")
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .padding()
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            UITextView.appearance().backgroundColor = .clear
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
