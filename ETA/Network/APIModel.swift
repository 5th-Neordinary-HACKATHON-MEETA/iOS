//
//  APIModel.swift
//  ETA
//
//  Created by YOUJIM on 11/25/23.
//

import Foundation

struct APIModel<T: Codable>: Codable {
    let success: Bool?
    let code: Int?
    let message: String?
    let result: T?
}
