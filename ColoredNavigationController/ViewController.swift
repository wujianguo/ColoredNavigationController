//
//  ViewController.swift
//  ColoredNavigationController
//
//  Created by wujianguo on 16/5/18.
//  Copyright © 2016年 wujianguo. All rights reserved.
//

import UIKit

class ViewControllerBase: ColoredBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "push", style: .Plain, target: self, action: #selector(push))
    }

    func push() {

    }

}

class ViewController4: ViewControllerBase {

    override func navigationBarBarTintColor() -> UIColor? {
        return UIColor.greenColor()
    }

    override func push() {

    }
}

class ViewController3: ViewControllerBase {

    override func navigationBarTransparent() -> Bool {
        return true
    }

    override func navigationBarTintColor() -> UIColor {
        return UIColor.purpleColor()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGrayColor()
    }

    override func push() {
        navigationController?.pushViewController(ViewController4(), animated: true)
    }
}

class ViewController2: ViewControllerBase {

    override func navigationBarBarTintColor() -> UIColor? {
        return UIColor.yellowColor()
    }

    override func navigationBarTranslucent() -> Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellowColor()
    }


    override func push() {
        navigationController?.pushViewController(ViewController3(), animated: true)
    }
}

class ViewController: ViewControllerBase {

    override func navigationBarBarTintColor() -> UIColor? {
        return UIColor.redColor()
    }

    override func push() {
        navigationController?.pushViewController(ViewController2(), animated: true)
    }
}

