//
//  AlamoHandler.swift
//  GiphyTrends
//
//  Created by Jason Tezanos on 7/29/16.
//  Copyright © 2016 NA. All rights reserved.
//
import Alamofire

class AlamoHandler {
    
    func makeRequestGetGIFs(type: Alamofire.Method, urlPath: URLPATH, parameters: [String: AnyObject], completion: (GIFs: [GIF]) -> Void) {
        var parametersWithLimitAndKey = Parameters.withLimitAndAPIKey
        parametersWithLimitAndKey.update(parameters)
        print(parametersWithLimitAndKey)
        
        Alamofire.request(type, Endpoints.baseURL + urlPath.rawValue, parameters: parametersWithLimitAndKey) .responseJSON {
            response in
            print(response.request)
            print(response.response)
            print(response.data)
            print(response.result.value)
            
            if let JSON = response.result.value as? JSONDictionary {
                completion(GIFs: self.toGIFs(JSON))
            }
        }
    }

    private func toGIFs(JSON: JSONDictionary) -> [GIF] {
        return Parser().trendingAPIResponseToGIFs(JSON)
    }
}