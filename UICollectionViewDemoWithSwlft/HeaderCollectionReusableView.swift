//
//  HeaderCollectionReusableView.swift
//  UICollectionViewDemoWithSwlft
//
//  Created by Tiank on 17/5/26.
//  Copyright © 2017年 besttone. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    var label : UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        label = UILabel(frame: self.bounds)
        label.textAlignment = NSTextAlignment.center
        label.text = "我是区头"
        label.font = UIFont.systemFont(ofSize: 25)
        self.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
