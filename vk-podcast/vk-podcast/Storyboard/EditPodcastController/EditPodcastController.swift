//
//  EditPodcastController.swift
//  vk-podcast
//
//  Created by Александр on 17.09.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit

class EditPodcastController: UIViewController {

    var url: URL?
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    private lazy var addTimecodeButton: AddTimecodeView = {
        var view = AddTimecodeView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        return view
    }()
    private lazy var timecodeLabel: UILabel = {
        var label = UILabel()
        label.text = "ТАЙМКОДЫ"
        label.font = UIFont.getSFProFont(type: .semibold, size: 13)
        label.textColor = Pallete.subtitle
        label.numberOfLines = 0
        
        return label
    }()
    private lazy var instructionLabel: UILabel = {
        var label = UILabel()
        label.text = "Отметки времени с названием темы. Позволяют слушателям легче путешествовать по подкасту."
        label.font = UIFont.getSFProFont(type: .regular, size: 13)
        label.textColor = Pallete.subtitle
        label.numberOfLines = 0
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Редактирование"
        self.setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        let timeline = TimelineView()
        timeline.translatesAutoresizingMaskIntoConstraints = false
        timeline.heightAnchor.constraint(equalToConstant: 192).isActive = true
        timeline.setupAudio(url: self.url!)
        timeline.onDidError = { errorString in
            self.navigationController?.popViewController(animated: true)
        }
        
        self.stackView.addArrangedSubview(timeline)
        self.stackView.addArrangedSubview(self.timecodeLabel)
        self.stackView.addArrangedSubview(self.addTimecodeButton)
        self.stackView.addArrangedSubview(self.instructionLabel)
        
        self.addTimecodeButton.didActionTapped = {
            if let index = self.stackView.arrangedSubviews.firstIndex(of: self.addTimecodeButton) {
                let timecodeView = self.createTimecode()
                self.stackView.insertArrangedSubview(timecodeView, at: index-1)
                UIView.animate(withDuration: 0.2) {
                    timecodeView.isHidden = false
                }
            }
        }
    }
    
    func createTimecode() -> InputTimecodeView {
        let timecode = InputTimecodeView()
        timecode.translatesAutoresizingMaskIntoConstraints = false
        timecode.heightAnchor.constraint(equalToConstant: 44).isActive = true
        timecode.isHidden = true
        timecode.didRemoveTapped = {
            UIView.animate(withDuration: 0.2, animations: {
                timecode.isHidden = true
            }) { (completion) in
                timecode.removeFromSuperview()
            }
        }
        
        return timecode
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
