//
//  MainTextField.swift
//  vk-podcast
//
//  Created by Александр on 17.09.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit

class MainTextField: NibView {

    @IBOutlet weak var containerView: UIView! {
        didSet {
            self.containerView.systemRound()
            self.containerView.layer.borderColor = Pallete.textfieldBorderColor.cgColor
            self.containerView.layer.borderWidth = 0.5
            self.containerView.backgroundColor = Pallete.textfieldBackground
        }
    }
    @IBOutlet weak var textField: UITextField!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
