//
//  ContentView.swift
//  NewsAPI
//
//  Created by Roy David (student LM) on 12/9/24.
//

import SwiftUI

struct ContentView: View {
    @State var data = FetchData()
    @State var json = "Loading..."
    
    var body: some View {
        ScrollView{
            ForEach(data.response.articles){
                a in
                VStack (alignment: .leading, content: {
                    Text("author: " + (a.author ?? " "))
                        .padding(.all)
                    
                    Text("Title: " + (a.title ?? " "))
                        .padding(.all)
                })
                
            }
        }
        VStack {
            Text("\(data.response.totalResults)")
                .font(.title)
        }
        .task {
            await data.getData()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
