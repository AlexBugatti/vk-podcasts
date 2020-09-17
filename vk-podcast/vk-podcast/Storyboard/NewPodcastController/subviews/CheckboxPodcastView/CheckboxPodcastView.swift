//
//  CheckboxPodcastView.swift
//  vk-podcast
//
//  Created by Александр on 16.09.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit

class CheckboxPodcastView: NibView {
        
    @IBOutlet weak var stackView: UIStackView!
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        let separateView = UIView()
        separateView.backgroundColor = #colorLiteral(red: 0.8438933492, green: 0.8473063111, blue: 0.8505352736, alpha: 1)
        separateView.translatesAutoresizingMaskIntoConstraints = false
        separateView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        self.stackView.addArrangedSubview(separateView)
        
        let content = CheckboxView()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.heightAnchor.constraint(equalToConstant: 48).isActive = true
        content.setupUI(text: "Ненормативный контент")
        self.stackView.addArrangedSubview(content)
        
        let export = CheckboxView()
        export.translatesAutoresizingMaskIntoConstraints = false
        export.heightAnchor.constraint(equalToConstant: 48).isActive = true
        export.setupUI(text: "Исключить эпизод из экспорта")
        self.stackView.addArrangedSubview(export)
        
        let trailer = CheckboxView()
        trailer.translatesAutoresizingMaskIntoConstraints = false
        trailer.heightAnchor.constraint(equalToConstant: 48).isActive = true
        trailer.setupUI(text: "Трейлер подкаста")
        self.stackView.addArrangedSubview(trailer)
        
        let selector = SelectorView()
        selector.translatesAutoresizingMaskIntoConstraints = false
        selector.heightAnchor.constraint(equalToConstant: 48).isActive = true
        self.stackView.addArrangedSubview(selector)
        
        let whiteView = UIView()
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        whiteView.heightAnchor.constraint(equalToConstant: 4).isActive = true
        self.stackView.addArrangedSubview(whiteView)
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.getSFProFont(type: .regular, size: 13)
        label.textColor = Pallete.subtitle
        label.numberOfLines = 0
        label.text = "При публикации записи с эпизодом, он становится доступным для всех пользователей"
        self.stackView.addArrangedSubview(label)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
