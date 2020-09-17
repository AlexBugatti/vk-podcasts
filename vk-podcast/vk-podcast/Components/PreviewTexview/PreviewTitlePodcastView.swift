//
//  PreviewTitlePodcastView.swift
//  vk-podcast
//
//  Created by Александр on 17.09.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit

class PreviewTitlePodcastView: NibView {

    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            self.imageView.systemRound()
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
