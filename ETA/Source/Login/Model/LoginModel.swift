//
//  LoginModel.swift
//  ETA
//
//  Created by 장준모 on 11/26/23.
//

import Foundation

struct LoginResponseModel: Codable {
    let id: String?
}

struct LoginRequestModel: Codable {
    let id: String
    let password: String
}
