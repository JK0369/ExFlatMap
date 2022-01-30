//
//  BaseViewController.swift
//  ExFlatmap
//
//  Created by 김종권 on 2022/01/30.
//

import JGProgressHUD

class BaseViewController: UIViewController {
  lazy var hud: JGProgressHUD = {
    let loader = JGProgressHUD(style: .dark)
    return loader
  }()
  
  func showLoading() {
    DispatchQueue.main.async {
      self.hud.show(in: self.view, animated: true)
    }
  }
  
  func hideLoading() {
    DispatchQueue.main.async {
      self.hud.dismiss(animated: true)
    }
  }
}
