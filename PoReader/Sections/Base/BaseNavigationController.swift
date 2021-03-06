//
//  BaseNavigationController.swift
//  PoReader
//
//  Created by 黄中山 on 2020/5/26.
//  Copyright © 2020 potato. All rights reserved.
//

import UIKit

class BaseNavigationController: PoNavigationController {

    // 返回按钮
    private lazy var backBtn: UIButton = {
        // 设置返回按钮属性
        let backBtn = UIButton(type: .custom)
        backBtn.setImage(UIImage(named: "navigation_back_white"), for: .normal)
        backBtn.titleLabel?.isHidden = true
        backBtn.addTarget(self, action: #selector(BaseNavigationController.backBtnClick), for: .touchUpInside)
        backBtn.contentHorizontalAlignment = .left
        backBtn.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        return backBtn
    }()
    
    @objc
    private func backBtnClick() {
        popViewController(animated: true)
    }
    
//    override var traitCollection: UITraitCollection
    
    /// Push
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
        }
        super.pushViewController(viewController, animated: true)
    }
}
