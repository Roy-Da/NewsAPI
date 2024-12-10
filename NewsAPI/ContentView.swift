//
//  ContentView.swift
//  NewsAPI
//
//  Created by Roy David (student LM) on 12/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var json = "Loading"
    
    var body: some View {
        VStack {
            Text(json)
        }
        .task {
            let url = URL(string: "https://www.hackingwithswift.com/samples/messages.json")!

               let (data, _) = try! await URLSession.shared.data(from: url)
            
             json = String(decoding: data, as: UTF8.self)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
