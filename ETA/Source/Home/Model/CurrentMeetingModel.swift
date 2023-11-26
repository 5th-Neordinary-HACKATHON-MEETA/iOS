//
//  CurrentMeetingModel.swift
//  ETA
//
//  Created by 윤지성 on 11/26/23.
//

import Foundation

struct CurrentMeetingRes: Codable {
//    let isSuccess: Bool
//    let code: Int
//    let message: String
    let result: Result?
//    let error: String?
}

// MARK: - Result
struct Result: Codable {
    let mostCurrentMeeting: MostCurrentMeeting
    let numUsers: Int

}

struct MostCurrentMeeting: Codable {
    let id, name, dateTime: String
    let duration: Int
    let location: String
    let team: CurrentTeam
}

// MARK: - Team
struct CurrentTeam: Codable {
    let id, name: String
    let maxMember: Int
    let startedAt, endedAt: String
}
