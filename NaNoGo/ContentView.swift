//
//  ContentView.swift
//  NaNoGo
//
//  Created by Lizz Clark on 14/07/2020.
//

import SwiftUI

struct ContentView: View {
    @SceneStorage("ContentView.text") private var text = ""
    @State private var fontSize: CGFloat = 16
    
    var body: some View {
        NavigationView {
            TextEditor(text: $text)
                .font(.system(size: fontSize))
                .foregroundColor(.black)
                .background(Color(red: 0.9, green: 0.9, blue: 1))
                .navigationTitle("NaNoGo")
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .padding()
        }
        .onAppear {
            UITextView.appearance().backgroundColor = .clear
        }
        .toolbar {
            ToolbarItem(placement: ToolbarItemPlacement.bottomBar) {
                HStack {
                    Button {
                        guard text != "" else { return }
                        fontSize -= 4
                    } label: {
                        Image(systemName: "minus.circle")
                    }
                    Text("Font Size")
                    Button {
                        guard text != "" else { return }
                        fontSize += 4
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
