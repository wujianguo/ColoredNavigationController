//
//  ViewController.swift
//  ColoredNavigationController
//
//  Created by wujianguo on 16/5/18.
//  Copyright © 2016年 wujianguo. All rights reserved.
//

import UIKit

class ViewControllerBase: ColoredBaseViewController, UITableViewDataSource {

    let tableView: UITableView = UITableView(frame: CGRectZero, style: .Plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "push", style: .Plain, target: self, action: #selector(push))
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "CellIdentifier")
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraint(NSLayoutConstraint(item: tableView, attribute: .Top, relatedBy: .Equal, toItem: topLayoutGuide, attribute: .Top, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: tableView, attribute: .Bottom, relatedBy: .Equal, toItem: bottomLayoutGuide, attribute: .Top, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: tableView, attribute: .Left, relatedBy: .Equal, toItem: view, attribute: .Left, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: tableView, attribute: .Right, relatedBy: .Equal, toItem: view, attribute: .Right, multiplier: 1, constant: 0))
    }

    func push() {

    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath)
        cell.backgroundColor = UIColor(red: CGFloat(arc4random()) % 255 / 255, green: CGFloat(arc4random()) % 255 / 255, blue: CGFloat(arc4random()) % 255 / 255, alpha: 1)
        return cell;
    }
}

class ViewController8: ViewControllerBase {
    
    override func navigationBarBarTintColor() -> UIColor? {
        return nil
    }
    
    override func push() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "origin"
        self.navigationItem.rightBarButtonItem = nil
    }
}


class ViewController7: ViewControllerBase {
    
    override func navigationBarTransparent() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Transparent"
    }
    
    override func push() {
        navigationController?.pushViewController(ViewController8(), animated: true)
    }
}


class ViewController6: ViewControllerBase {
    
    override func navigationBarTransparent() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Transparent"
    }
    
    override func push() {
        navigationController?.pushViewController(ViewController7(), animated: true)
    }
}

class ViewController5: ViewControllerBase {
    
    override func navigationBarBarTintColor() -> UIColor? {
        return UIColor.blueColor()
    }
    
    override func push() {
        navigationController?.pushViewController(ViewController6(), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "blueColor"
    }
}

class ViewController4: ViewControllerBase {

    override func navigationBarBarTintColor() -> UIColor? {
        return UIColor.greenColor()
    }

    override func push() {
        navigationController?.pushViewController(ViewController5(), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "greenColor"
    }
}

class ViewController3: ViewControllerBase {

    override func navigationBarTransparent() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Transparent"
    }

    override func push() {
        navigationController?.pushViewController(ViewController4(), animated: true)
    }
}

class ViewController2: ViewControllerBase {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "yellowColor"
    }
    
    override func navigationBarBarTintColor() -> UIColor? {
        return UIColor.yellowColor()
    }
    
    override func push() {
        navigationController?.pushViewController(ViewController3(), animated: true)
    }
}

class ViewController: ViewControllerBase {
    
    override func navigationBarBarTintColor() -> UIColor? {
        return nil
    }

    override func push() {
        navigationController?.pushViewController(ViewController2(), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "origin"
    }
}

