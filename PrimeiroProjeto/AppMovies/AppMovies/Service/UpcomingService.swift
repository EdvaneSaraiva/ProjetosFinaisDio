//
//  UpcomingService.swift
//  AppMovies
//
//  Created by Edvane Batista Saraiva Bruno on 22/10/23.
//

import Foundation
import Alamofire

class UpcomingService {
    
    func getUpcoming(_ callBack:@escaping(UpcomingResult?) -> Void) {
        var components = BaseURL.shared.url
        components.path = Route.upcoming.rawValue
        components.queryItems = [
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: "1")
        ]
        
        guard let url = components.url else {
            callBack(nil)
            return
        }
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(Credentials().accessToken)",
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
        
        AF.request(url, method: .get, headers: headers).responseDecodable(of: UpcomingResult.self) { response in
           switch response.result {
           case let .success(data):
               callBack(data)
//               print(data)
           case let .failure(error):
               callBack(nil)
               print(error)
           }
        }
    }
}
