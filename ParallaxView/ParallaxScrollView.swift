//
//  ParallaxView.swift
//  ParallaxView
//
//  Created by 张海迪 on 15/5/19.
//  Copyright (c) 2015年 haidi. All rights reserved.
//

import UIKit

class ParallaxScrollView: UIView
{
    var offset:CGPoint = CGPointZero;
    var headerImage:UIImage?;
    private var imageScrollView:UIScrollView?;
    private var imageView:UIImageView?;
    private let kParallaxDeltaFactor:CGFloat = 0.5;
    
    required  init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder);
    }
    override init(frame: CGRect)
    {
        super.init(frame: frame);
    }
    class func parallaxHeaderView(#image: UIImage, forSize headerSize: CGSize) -> ParallaxScrollView
    {
        let headerView = ParallaxScrollView(frame: CGRect(origin: CGPointZero, size: headerSize));
        headerView.headerImage = image;
        headerView.initialSetupForDefaultHeader();
        return headerView;
    }
    func initialSetupForDefaultHeader()
    {
        self.imageScrollView = UIScrollView(frame: self.bounds);
        self.imageView = UIImageView(frame: self.imageScrollView!.bounds);
        self.imageView!.autoresizingMask = .FlexibleLeftMargin | .FlexibleRightMargin | .FlexibleTopMargin | .FlexibleBottomMargin | .FlexibleWidth | .FlexibleHeight;
        self.imageView!.contentMode = UIViewContentMode.ScaleAspectFill;
        self.imageView!.image = self.headerImage;
        self.imageScrollView!.addSubview(imageView!);
        self.addSubview(imageScrollView!);
    }
    
    func layoutHeaderViewForScrollViewOffset(offset:CGPoint)
    {
        var frame = self.imageScrollView!.frame;
        if offset.y > 0
        {
            frame.origin.y = max(offset.y * kParallaxDeltaFactor, 0);
            self.imageScrollView!.frame = frame;
            self.clipsToBounds = true;
        }
        else
        {
            var delta:CGFloat = 0;
            var rect:CGRect = self.bounds;
            delta = fabs(min(0, offset.y));
            rect.origin.y -= delta;
            rect.size.height += delta;
            self.imageScrollView!.frame = rect;
            self.clipsToBounds = false;
        }
    }
}
