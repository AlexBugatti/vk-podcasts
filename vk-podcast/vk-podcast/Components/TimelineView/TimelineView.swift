//
//  TimelineView.swift
//  vk-podcast
//
//  Created by Александр on 17.09.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit
import SCWaveformView

class TimelineView: NibView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var containerView: UIView! {
        didSet {
            self.containerView.layer.cornerRadius = Constants.mainButtonCornerRadius
            self.containerView.layer.masksToBounds = true
            self.containerView.layer.borderWidth = 0.5
            self.containerView.layer.borderColor = Pallete.textfieldBorderColor.cgColor
        }
    }

    func setupAudio(url: URL) {
        
        var scroll = SCScrollableWaveformView.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 140))
        let waveform = SCWaveformView.init()
        let asset = AVAsset(url: url)
        scroll.waveformView.asset = asset
        scroll.waveformView.precision = 0.25; // We are going to render one line per four pixels

        scroll.waveformView.normalColor = .green
        scroll.waveformView.progressColor = Pallete.main

        // Set the play progress
        scroll.waveformView.progressTime = CMTimeMakeWithSeconds(5, preferredTimescale: 10000)

        // Show only the first second of your asset
        scroll.waveformView.timeRange = CMTimeRangeMake(start: CMTime.zero, duration: CMTimeMakeWithSeconds(1, preferredTimescale: 1))
        // Set the lineWidth so we have some space between the lines
        scroll.waveformView.lineWidthRatio = 2;

        // Show stereo if available
        scroll.waveformView.channelStartIndex = 0;
        scroll.waveformView.channelEndIndex = 0;

        // Show only right channel
//        waveform.channelStartIndex = 1;
//        waveform.channelEndIndex = 1;

        // Add some padding between the channels
//        waveform.channelsPadding = 10;
//        waveform.backgroundColor = .cyan
//        scroll.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(scroll)
        
//        let constraints = [self.contentView.leadingAnchor.constraint(equalTo: scroll.waveformView.leadingAnchor),
//                           self.contentView.trailingAnchor.constraint(equalTo: scroll.waveformView.trailingAnchor),
//                           self.contentView.topAnchor.constraint(equalTo: scroll.waveformView.topAnchor),
//                           self.contentView.bottomAnchor.constraint(equalTo: scroll.waveformView.bottomAnchor)]
//        NSLayoutConstraint.activate(constraints)
        //
        // Get the audio data from the audio file
        //
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
