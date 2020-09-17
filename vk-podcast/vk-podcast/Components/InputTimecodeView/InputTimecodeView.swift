//
//  InputTimecodeView.swift
//  vk-podcast
//
//  Created by Александр on 17.09.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit

class InputTimecodeView: NibView {

    var didRemoveTapped: (()->Void)?
    
    @IBAction func didRemoveTapped(_ sender: Any) {
        self.didRemoveTapped?()
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
