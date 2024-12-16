//
//  WebViewContainer.swift
//  NewsAPI
//
//  Created by Roy David (student LM) on 12/13/24.
//

import SwiftUI

struct WebViewContainer: View {
    @Binding var viewState: ViewState
    @Binding var articleURL: String
    var body: some View {
        VStack{
            Button(action: {
                viewState = .articleList
            }, label: {
                HStack {
                    Text("<")
                        .padding(.leading)
                    Spacer()
                }
            })
            SwiftUIWebView(urlString: articleURL)
        }
    }
}

#Preview {
    WebViewContainer(viewState: .constant(.articleList), articleURL: .constant("https://newsapi.org/v2/everything?q=tesla&language =en&from=2024-12-09&sortBy=publishedAt&apiKey=6a8dd7bc682148e3a9997c3eb1caee2f"))
}
