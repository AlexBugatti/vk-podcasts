//
//  PodcastView.swift
//  vk-podcast
//
//  Created by Александр on 17.09.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit

class PodcastView: NibView {

    var didEditAction: (()->Void)?
    var didUploadAction: (()->Void)?
    
    @IBOutlet weak var iconView: UIView! {
        didSet {
            self.iconView.layer.cornerRadius = 10
            self.iconView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var uploadButton: WhiteMainBigButton! {
        didSet {
            self.uploadButton.layer.borderWidth = 0
        }
    }
    
    @IBAction func onDidEditTapped(_ sender: Any) {
        self.didEditAction?()
    }
    
    @IBAction func onDidUploadTapped(_ sender: Any) {
        self.didUploadAction?()
    }
    
    func setup(title: String, duration: String) {
        self.titleLabel.text = title
        self.rateLabel.text = duration
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
