//
//  WebService.swift
//  DnD Helper
//
//  Created by Rafael Plinio on 27/06/21.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
}

class WebService {
//    let baseURL = Endpoints.baseURL
    
    func getClasses() {
        var request = URLRequest(url: URL(string: "")!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("error=\(String(describing: error))")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("statusCode should be 200, but is (httpStatus.statusCode)")
                print("response = \(String(describing: response))")
            }
            
            if let className = try? JSONDecoder().decode(ClassList.self, from: data) {
                for className in className.results {
                    print(className.name)
                }
            }
        }
        task.resume()
    }
    
//    func getClasses2(url: URL, completionHandler: @escaping ([Article]?) -> ()) {
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let error = error {
//                print(error.localizedDescription)
//                completionHandler(nil)
//            } else if let data = data {
//
//                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
//
//                if let articleList = articleList {
//                    completionHandler(articleList.articles)
//                }
//            }
//        }.resume()
//    }
    
}
