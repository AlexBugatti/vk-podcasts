//
//  WhiteMainButton.swift
//  vk-podcast
//
//  Created by Александр on 16.09.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit

class WhiteMainButton: UIButton {

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
        self.layer.borderWidth = 0.5
        self.layer.borderColor = Pallete.main.cgColor
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor.clear
        self.setTitleColor(Pallete.main, for: .normal)
        self.titleLabel?.font = UIFont.getSFProFont(type: .medium, size: 15)
    }
    
}

class WhiteMainBigButton: UIButton {

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
        self.layer.borderWidth = 0.5
        self.layer.borderColor = Pallete.main.cgColor
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor.clear
        self.setTitleColor(Pallete.main, for: .normal)
        self.titleLabel?.font = UIFont.getSFProFont(type: .medium, size: 17)
    }
    
}
