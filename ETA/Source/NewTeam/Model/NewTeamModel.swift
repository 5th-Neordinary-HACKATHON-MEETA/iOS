//
//  NewTeamModel.swift
//  ETA
//
//  Created by 윤지성 on 11/26/23.
//

import Foundation



struct newTeamRequest: Codable {
    let name: String
    let maxMember: String
    let startedAt: String
    let endedAt: String
}

struct newTeamResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: String?
    let error: Error?
}


// MARK: - Error
struct Error: Codable {
    let message: String
}
