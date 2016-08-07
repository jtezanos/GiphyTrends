//
//  Constants.swift
//  GiphyTrends
//
//  Created by Jason Tezanos on 7/28/16.
//  Copyright © 2016 NA. All rights reserved.
//

struct Constants {
    
    static let error = "error"
    static let GIFCellReuseIdentifier = "GIFCollectionViewCell"
    static let searchViewControllerName = "SearchViewController"
    static let settingsNavigationControllerName = "SettingsNavigationController"
}

struct Endpoints {
    
    //MARK: URLS & Paths
    static let baseURL = "https://api.giphy.com"
    //PATHS
    static let trendingPath = "/v1/gifs/trending"
    static let searchPath = "/v1/gifs/search"
    //FULL URLS
    static var trendingURL = baseURL + trendingPath
    static var searchURL = baseURL + searchPath
}

struct Keys {
    
    //MARK: Key to parse Data -> [JSONDictionary]
    static let data = "data"
    
    //MARK: Key to parse dictionaryForFixedHeight -> url = String
    static let URL = "url"
    
    //MARK: Keys for [JSONDictionary] -> [GIF]
    static let type = "type"
    static let images = "images"
    static let rating = "rating"
    static let trendingDateTime = "trending_datetime"
    
    //MARK: Parameter Dictionary Keys
    static let searchStringKey = "q"
    
    //MARK: Public Beta API Key
    static let apiKey = "dc6zaTOxFJmzC"
    
    struct ImagesKeys {
        //MARK: Images Keys
        static let fixedHeight = "fixed_height_downsampled"
    }
}

struct Parameters {
    
    //MARK: Parameters Dictionary that contains API Key
    static var withAPIKey: Dictionary<String,AnyObject> = ["api_key": Keys.apiKey]
    static let limitValue = "25"
    //User withLimitAndAPIKey Dictionary in order to limit # of GIFs returned from API
    static var withLimitAndAPIKey: Dictionary<String,AnyObject> = ["api_key": Keys.apiKey, "limit": Parameters.limitValue]
    
}

//MARK: - Typealias
typealias JSONDictionary = [String: AnyObject]

//MARK: - Enums
public enum URLPATH: RawRepresentable {
    case Trending, Search
    
    public init?(rawValue: String) {
        if rawValue == String(Endpoints.trendingPath) {
            self = Trending
        }
        else if rawValue == String(Endpoints.searchPath) {
            self = Search
        }
        else {
            return nil
        }
    }
    public var rawValue: String {
        switch self {
        case Trending: return String(Endpoints.trendingPath)
        case Search: return String(Endpoints.searchPath)
        }
    }
}
