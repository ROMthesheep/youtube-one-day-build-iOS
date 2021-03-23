//
//  Video.swift
//  yt-otb
//
//  Created by Rom on 22/03/2021.
//

import Foundation

struct Video: Decodable {
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys: String, CodingKey{
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
        
        case snippet
        case thumbnails
        case high
        case resourceId
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // parsing containers
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        print("vamo bie")
        // parsing elements
        
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
        
    }
    
}
