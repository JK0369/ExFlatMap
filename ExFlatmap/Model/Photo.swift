//
//  Photo.swift
//  ExFlatmap
//
//  Created by 김종권 on 2022/01/30.
//

import Foundation

struct Photo: Codable {
    let id: String
    let height, width: Int
    let urls: Urls
}

// MARK: - Urls
struct Urls: Codable {
    let raw, full, thumb, regular: String
    let small: String
}
