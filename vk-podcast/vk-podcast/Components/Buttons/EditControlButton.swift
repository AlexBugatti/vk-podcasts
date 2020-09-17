//
//  EditControlButton.swift
//  vk-podcast
//
//  Created by Александр on 17.09.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit

@IBDesignable
class EditControlButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setupUI() {
        self.layer.cornerRadius = Constants.mainButtonCornerRadius
        self.layer.masksToBounds = true
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.getSFProFont(type: .medium, size: 15)
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

