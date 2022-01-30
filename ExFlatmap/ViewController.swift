//
//  ViewController.swift
//  ExFlatmap
//
//  Created by 김종권 on 2022/01/30.
//

import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa
import JGProgressHUD

class ViewController: BaseViewController {
  private let button = UIButton().then {
    $0.setTitle("확인", for: .normal)
    $0.setTitleColor(.systemBlue, for: .normal)
    $0.setTitleColor(.blue, for: .highlighted)
  }
  private let label = UILabel().then {
    $0.textColor = .black
    $0.numberOfLines = 0
  }
  private let imageView = UIImageView().then {
    $0.contentMode = .scaleAspectFill
  }
  
  private let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(self.button)
    self.view.addSubview(self.label)
    self.view.addSubview(self.imageView)
    self.button.snp.makeConstraints {
      $0.top.equalTo(self.view.safeAreaLayoutGuide).inset(16)
      $0.centerX.equalToSuperview()
    }
    self.label.snp.makeConstraints {
      $0.top.equalTo(self.button.snp.bottom).offset(16)
      $0.left.right.equalToSuperview().inset(16)
    }
    self.imageView.snp.makeConstraints {
      $0.top.equalTo(self.label.snp.bottom).offset(8)
      $0.centerX.equalToSuperview()
    }
    
    self.button.rx.tap
      .flatMap { API.getPhoto() }
      .map(\.urls.regular)
      .map { [weak self] in
        self?.label.text = $0
        return $0
      }
      .do(onNext: { [weak self] _ in self?.showLoading() })
      .flatMap { API.getPhoto(url: $0) }
      .delay(.seconds(3), scheduler: MainScheduler.asyncInstance)
      .do(onNext: { [weak self] _ in self?.hideLoading() })
      .bind(to: self.imageView.rx.image)
      .disposed(by: self.disposeBag)
  }
}
