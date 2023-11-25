//
//  AnnouncementModel.swift
//  ETA
//
//  Created by YOUJIM on 11/26/23.
//

import Foundation

struct Announcements: Codable {
    let teamName: String?
    let title: String?
    let nickname: String?
}

struct AnnouncementResponseModel: Codable {
    let announcements: [Announcements]
}

struct AnnouncementRequestModel: Codable {
    
}
