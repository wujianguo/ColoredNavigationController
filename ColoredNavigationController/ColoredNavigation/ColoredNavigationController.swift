//
//  ColoredNavigationController.swift
//  ColoredNavigationController
//
//  Created by wujianguo on 16/5/18.
//  Copyright © 2016年 wujianguo. All rights reserved.
//

import UIKit


class ColoredBaseViewController: UIViewController {

    func navigationBarTransparent() -> Bool {
        return false
    }

    func navigationBarBarTintColor() -> UIColor? {
        return navigationController?.navigationBar.barTintColor
    }
    
    func navigationBarBarStyle() -> UIBarStyle {
        return navigationController!.navigationBar.barStyle
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        addFakeNavigationBar()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.updateNavigationBarUI(navigationController?.navigationBar)
        self.removeFakeNavigationBar()
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        addFakeNavigationBar()
    }

    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        removeFakeNavigationBar()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        fakeBar?.frame = CGRectMake(0, 0, CGRectGetWidth(view.bounds), topLayoutGuide.length)
    }

    func updateNavigationBarUI(bar: UINavigationBar?) {
        bar?.barTintColor = navigationBarBarTintColor()
        bar?.barStyle = navigationBarBarStyle()
        if navigationBarTransparent() {
            bar?.shadowImage = UIImage()
            bar?.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        } else {
            bar?.shadowImage = nil;
            bar?.setBackgroundImage(nil, forBarMetrics: .Default)
        }
    }

    var fakeBar: UINavigationBar?
    func addFakeNavigationBar() {
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        fakeBar = UINavigationBar()
        updateNavigationBarUI(fakeBar!)
        view.addSubview(fakeBar!)
        fakeBar?.frame = CGRectMake(0, 0, CGRectGetWidth(view.bounds), topLayoutGuide.length)
    }

    func removeFakeNavigationBar() {
        fakeBar?.removeFromSuperview()
        fakeBar = nil
    }
}
