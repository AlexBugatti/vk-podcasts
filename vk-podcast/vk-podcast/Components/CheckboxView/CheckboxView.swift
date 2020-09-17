//
//  CheckboxView.swift
//  vk-podcast
//
//  Created by Александр on 16.09.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit

class CheckboxView: NibView {

    var isOn = false {
        didSet {
            self.updateUI()
        }
    }
    var title: String?
    
    @IBOutlet weak var checkImageView: UIImageView! {
        didSet {
            self.checkImageView.layer.cornerRadius = 4
            self.checkImageView.layer.borderWidth = 1
            self.checkImageView.layer.borderColor = #colorLiteral(red: 0.7190997005, green: 0.7549208999, blue: 0.797947526, alpha: 1)
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func onDidButtonAction(_ sender: Any) {
        self.isOn = !self.isOn
    }
    
    func updateUI() {
        if self.isOn {
            self.checkImageView?.layer.borderWidth = 0
            self.checkImageView?.image = #imageLiteral(resourceName: "check")
        } else {
            self.checkImageView?.layer.borderWidth = 1
            self.checkImageView?.image = nil
        }
    }
    
    func setupUI(text: String) {
        self.titleLabel.text = text
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
