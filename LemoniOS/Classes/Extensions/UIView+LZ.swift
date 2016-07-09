//
//  UIView+LZ.swift
//  LemoniOS
//
//  Created by lucas on 16/7/9.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

import UIKit

extension UIView {
    
    func lz_pinAllEdgesOfSubView(subView: UIView) {
        self.lz_pinSubview(subView: subView, toEdge: .top)
        self.lz_pinSubview(subView: subView, toEdge: .leading)
        self.lz_pinSubview(subView: subView, toEdge: .bottom)
        self.lz_pinSubview(subView: subView, toEdge: .trailing)
    }
    
    func lz_pinSubview(subView: UIView, toEdge attribute: NSLayoutAttribute) {
        self.addConstraint(NSLayoutConstraint(item: self,
                                              attribute: attribute,
                                              relatedBy: .equal,
                                              toItem: subView,
                                              attribute: attribute,
                                              multiplier: 1.0,
                                              constant: 0.0))
    }
}
