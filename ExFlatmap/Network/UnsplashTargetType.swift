//
//  UnsplashTargetType.swift
//  ExFlatmap
//
//  Created by 김종권 on 2022/01/30.
//

import Moya

enum UnsplashTargetType: TargetType {
  case getPhoto
}

extension UnsplashTargetType {
  var baseURL: URL {
    return URL(string: "https://api.unsplash.com/")!
  }
  
  var path: String {
    switch self {
    case .getPhoto:
      return "photos/random"
    }
  }
  
  var method: Method {
    switch self {
    case .getPhoto:
      return .get
    }
  }
  
  var task: Task {
    return .requestPlain
  }
  
  var headers: [String : String]? {
    return [
      "Content-Type": "application/json",
      "Authorization": "Client-ID A_zoeYvBtQoSlNw51lkUN0C0YOa3XhvuENeFvI0AIAk"
    ]
  }
}
