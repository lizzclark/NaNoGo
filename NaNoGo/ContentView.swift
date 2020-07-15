//
//  ContentView.swift
//  NaNoGo
//
//  Created by Lizz Clark on 14/07/2020.
//

import SwiftUI

extension String {
    struct Key {
        static let foregroundColor = "ForegroundColor"
        static let backgroundColor = "BackgroundColor"
        static let fontSize = "FontSize"
    }
}

struct ContentView: View {
    @Binding var document: TextFile
    @AppStorage("fontSize") private var fontSize = 16
    @State private var background: Color
    @State private var foreground: Color
    @AppStorage("wordsWritten") private var wordsWritten = 0
    
    init(document: Binding<TextFile>) {
        let foregroundColor = UserDefaults.standard.color(forKey: String.Key.foregroundColor) ?? .black
        let backgroundColor = UserDefaults.standard.color(forKey: String.Key.backgroundColor) ?? .white
        _foreground = State(wrappedValue: foregroundColor)
        _background = State(wrappedValue: backgroundColor)
        _document = document
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ProgressView("Word count: \(wordsWritten)", value: min(200, Double(wordsWritten)), total: 200)
                    .accentColor(foreground)
                ColorPicker("Text colour", selection: $foreground)
                ColorPicker("Background colour", selection: $background)
                    .padding(.bottom, 12)
                TextEditor(text: $document.text)
                    .font(.system(size: CGFloat(fontSize)))
                    .foregroundColor(foreground)
                    .background(background)
                    .navigationTitle("NaNoGo")
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            }
            .padding()
        }
        .onAppear {
            UITextView.appearance().backgroundColor = .clear
        }
        .toolbar {
            ToolbarItem(placement: ToolbarItemPlacement.bottomBar) {
                HStack {
                    Button {
                        fontSize -= 4
                    } label: {
                        Image(systemName: "minus.circle")
                    }
                    Text("Font Size")
                    Button {
                        fontSize += 4
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onChange(of: background) { color in
            UserDefaults.standard.set(color, forKey: String.Key.backgroundColor)
        }
        .onChange(of: foreground) { color in
            UserDefaults.standard.set(color, forKey: String.Key.foregroundColor)
        }
        .onChange(of: document.text) { text in
            wordsWritten = text.components(separatedBy: .whitespacesAndNewlines).filter{ $0.isEmpty == false }.count
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(TextFile()))
    }
}
