//
//  NewMeeting.swift
//  ETA
//
//  Created by 장준모 on 11/26/23.
//

import Foundation

struct MeetingResponseModel: Codable {
    let id: String?
}

struct MeetingRequestModel: Codable {
    let name: String
    let teamId: String
    let duration: Int
}
