//
//  ARModel.swift
//  ARStories

//  Created by apple on 17/10/21.
//  Copyright © 2021 apple. All rights reserved.


import Foundation

struct UserDetails : Decodable {
    var name: String = ""
    var imageUrl: String = ""
    var content: [Content] = []

    enum CodingKeys: String, CodingKey {
       case name
       case imageUrl
    }

    init(userDetails: [String: Any]) {
        name = userDetails["name"] as? String ?? ""
        imageUrl = userDetails["imageUrl"] as? String ?? ""
        let aContent = userDetails["content"] as? [[String : Any]] ?? []
        for element in aContent {
            content += [Content(element: element)]
        }
    }
}

struct Content {
    var type: String
    var url: String
    init(element: [String: Any]) {
        type = element["type"] as? String ?? ""
        url = element["url"] as? String ?? ""
    }
}


