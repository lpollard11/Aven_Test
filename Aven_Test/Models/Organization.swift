//
//  Organization.swift
//  Aven_Test
//
//  Created by Lee Pollard on 8/19/21.
//

import Foundation

struct Organization: Decodable {
    let url: String
    let name: String
    let description: String?
    let imageURL: String
    
    private enum CodingKeys: String, CodingKey {
        case url
        case description
        case imageURL = "avatar_url"
        case name = "login"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let url = try container.decode(String.self, forKey: .url)
        let name = try container.decode(String.self, forKey: .name)
        let description = try container.decodeIfPresent(String.self, forKey: .description)
        let imageURL = try container.decode(String.self, forKey: .imageURL)
        
        self.url = url
        self.name = name
        self.imageURL = imageURL
        self.description = description
    }
}
