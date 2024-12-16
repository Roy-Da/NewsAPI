//
//  FetchData.swift
//  NewsAPI
//
//  Created by Roy David (student LM) on 12/12/24.
//

import Foundation

struct FetchData{
    var response: Response = Response()
    
    mutating func getData() async{
        let URLString = "https://newsapi.org/v2/everything?q=tesla&language =en&from=2024-12-09&sortBy=publishedAt&apiKey=6a8dd7bc682148e3a9997c3eb1caee2f"
        
        guard let url = URL(string: URLString) else {return}
        
        let(data, _) = try! await URLSession.shared.data(from: url)
        response = try! JSONDecoder().decode(Response.self, from: data)
        
        let dataString = String(data: data, encoding: .utf8)
        print(dataString ?? " ")
    }
    
}

struct Response: Codable{
    var status: String = ""
    var totalResults: Int = 0
    var articles: [Article] = []
}

struct Article: Codable{
    var title: String?
    var author: String?
    var url: String?
    var urlToImage: URL?
}

extension Article: Identifiable{
    var id: String {title ?? " "}
}
