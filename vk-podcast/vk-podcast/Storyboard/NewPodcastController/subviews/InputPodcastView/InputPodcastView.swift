//
//  InputPodcastView.swift
//  vk-podcast
//
//  Created by Александр on 16.09.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit

class InputPodcastView: NibView {

    var didActionTapped: (()->Void)?
    
    @IBOutlet private weak var imagePickerView: UIView! {
        didSet {
            self.imagePickerView.backgroundColor = Pallete.textfieldBackground
            self.imagePickerView.layer.borderColor = Pallete.textfieldBorderColor.cgColor
            self.imagePickerView.layer.borderWidth = 0.5
            self.imagePickerView.systemRound()
        }
    }
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var titleTextField: MainTextField! {
        didSet {
            self.titleTextField.textField.placeholder = "Введите название подкаста"
        }
    }
    @IBOutlet weak var descriptionTextField: MainTextView!
    
    func setImage(_ image: UIImage) {
        self.coverImageView.image = image
    }
    
    @IBAction func onDidSelectImageTapped(_ sender: Any) {
        self.didActionTapped?()
    }
    
    func getInfo() -> (UIImage, String, String)? {
        guard let image = self.coverImageView.image else {
            return nil
        }
        guard let title = self.titleTextField.textField.text else {
            return nil
        }
        guard let description = self.descriptionTextField.textView.text else {
            return nil
        }
        
        return (image, title, description)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
