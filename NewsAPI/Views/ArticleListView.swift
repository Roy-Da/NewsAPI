//
//  ArticleListView.swift
//  NewsAPI
//
//  Created by Roy David (student LM) on 12/13/24.
//

import SwiftUI

struct ArticleListView: View {
    @Binding var articleURL: String
    @Binding var viewState: ViewState
    @State var data: FetchData = FetchData()
    
    var body: some View {
        ScrollView{
            ForEach(data.response.articles){ article in
                Button(action: {
                    articleURL = article.url ?? "www.google.com"
                    viewState = .webView
                }, label: {
                    ZStack{
                        Rectangle()
                            .foregroundColor(.red)
                            .cornerRadius(10)
                        VStack{
                            AsyncImage(url: article.urlToImage){
                                phase in
                                switch phase{
                                case.failure:
                                    Image("fnf")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding()
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding()
                                default:
                                    ProgressView()
                                }
                            }
                            Text(article.title ?? " ")
                                .padding()
                        }
                    }
                    .padding()
                })
                
                
            }
        }.task {
            await data.getData()
        }
    }
}

#Preview {
    ArticleListView(articleURL: .constant("https://newsapi.org/v2/everything?q=tesla&language =en&from=2024-12-09&sortBy=publishedAt&apiKey=6a8dd7bc682148e3a9997c3eb1caee2f"), viewState: .constant(.articleList))
}
