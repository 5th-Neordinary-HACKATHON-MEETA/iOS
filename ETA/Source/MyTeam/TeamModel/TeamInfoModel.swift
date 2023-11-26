//
//  TeamInfoModel.swift
//  ETA
//
//  Created by YOUJIM on 11/26/23.
//

import Foundation

struct Announcement: Codable {
    let id: String
    let content: String
}

struct Previous: Codable {
    let previously: [Info]
    let meeting: PossibleArray?
}

struct PossibleArray: Codable {
    let id: String
    let name: String
    let dateTime: String?
    let duration: Int
    let location: String
    let team: team
    let possibleTimes: [PossableTime]
}

struct PossableTime: Codable {
    let id: String
    let possibleTime: String
    let user: user
}

struct user: Codable {
    let id: String
    let nickname: String
}

struct Info: Codable {
    let id: String
    let name: String
    let dateTime: String
    let duration: Int
    let location: String
    let team: team
    let announcement: Announcement?
}

struct TeamInfoResponseModel: Codable {
    let meets: Previous
}

struct TeamInfoRequestModel: Codable {
    
}
