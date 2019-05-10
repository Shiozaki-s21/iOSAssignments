//
//  UIplusInitializer.swift
//  Assignment5
//
//  Created by SubaruShiozaki on 2019-05-02.
//  Copyright © 2019 Kazuya Takahashi. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(title: String, fontSize: CGFloat, bold: Bool = false, color:UIColor) {
        self.init(frame: CGRect())
        
        translatesAutoresizingMaskIntoConstraints = false
        text = title
        font = UIFont.boldSystemFont(ofSize: 28)
        textColor = color
        if bold {
            font = UIFont.boldSystemFont(ofSize: fontSize)
        } else {
            font = UIFont(descriptor: .init(), size: fontSize)
        }
    }
}
