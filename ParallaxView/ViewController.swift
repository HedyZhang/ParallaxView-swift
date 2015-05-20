//
//  ViewController.swift
//  View
//
//  Created by 张海迪 on 15/5/19.
//  Copyright (c) 2015年 haidi. All rights reserved.
//

import UIKit
let Identifier = "cell"
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    var dataTableView: UITableView?;
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder);
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataTableView = UITableView(frame: self.view.bounds, style: .Plain);
        self.dataTableView!.dataSource = self;
        self.dataTableView!.delegate = self;
        self.view.addSubview(dataTableView!);
        self.dataTableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: Identifier);
        self.dataTableView!.tableHeaderView = headView;
        
        
    }
    lazy var headView:ParallaxScrollView = {
        let aview = ParallaxScrollView.parallaxHeaderView(image: UIImage(named: "FriendsBackground")!, forSize:CGSize(width: self.dataTableView!.frame.size.width, height: 300));
        var AView = ParallaxScrollView()
        return aview;
        
        }();

    func scrollViewDidScroll(scrollView: UIScrollView) {
        headView.layoutHeaderViewForScrollViewOffset(scrollView.contentOffset);
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(Identifier) as! UITableViewCell;
        cell.textLabel!.text = "\(indexPath.row)";
        
        return cell;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

