//
//  Models.swift
//  APIParsing
//
//  Created by Vansh Dubey on 11/05/23.
//

import Foundation

struct DataModel:Decodable{
    let name: String?
    let url: String?
    enum CodingKeys: String,CodingKey {
        case name = "name"
        case url = "url"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.url = try container.decode(String.self, forKey: .url)
    }
}

struct jsonData: Decodable{
    let count: Int?
    let next: String?
    let previous: String?
    let results: [DataModel]?
    
    enum CodingKeys: String,CodingKey {
        case count = "count"
        case next = "next"
        case previous = "previous"
        case results = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.count = try container.decode(Int?.self, forKey: .count)
        self.next = try container.decode(String?.self, forKey: .next)
        self.previous = try container.decode(String?.self, forKey: .previous)
        self.results = try container.decode([DataModel].self, forKey: .results)
    }
}
