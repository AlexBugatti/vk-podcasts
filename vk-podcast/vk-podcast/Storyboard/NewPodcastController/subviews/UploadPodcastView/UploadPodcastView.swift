//
//  UploadPodcastView.swift
//  vk-podcast
//
//  Created by Александр on 16.09.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit

class UploadPodcastView: NibView {

    var didUploadTapped: (()->Void)?
    
    @IBAction func didActionTapped(_ sender: Any) {
        self.didUploadTapped?()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
