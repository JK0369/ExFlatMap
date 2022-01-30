//
//  API.swift
//  ExFlatmap
//
//  Created by 김종권 on 2022/01/30.
//

import Moya
import RxSwift

private let provider = MoyaProvider<UnsplashTargetType>()

enum API {
  static func getPhoto() -> Observable<Photo> {
    provider.rx.request(.getPhoto)
      .map(Photo.self)
      .asObservable()
      .do(onError: { print("Error = \($0)") })
  }
  
  static func getPhoto(url: String) -> Observable<UIImage> {
    guard
      let url = URL(string: url),
      let data = try? Data(contentsOf: url),
      let image = UIImage(data: data)
    else { return .empty() }
    return .just(image)
  }
}
