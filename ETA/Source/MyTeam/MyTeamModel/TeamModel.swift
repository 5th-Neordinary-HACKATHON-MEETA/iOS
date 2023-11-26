//
//  TeamModel.swift
//  ETA
//
//  Created by 장준모 on 11/26/23.
//

import Foundation

struct teamResponseModel: Codable {
    let teams: [team]
    
}

struct team: Codable {
    let id: String?
    let name: String
    let maxMember: Int
    let startedAt: String
    let endedAt: String
    
}

struct teamRequestModel: Codable {
    let id: String
    let password: String
}
