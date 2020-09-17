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

    var onDidError: ((String)->Void)?
    
    var avPlayer: AVAudioPlayer!
    var scrollableWaveformView: SCScrollableWaveformView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var containerView: UIView! {
        didSet {
            self.containerView.layer.cornerRadius = Constants.mainButtonCornerRadius
            self.containerView.layer.masksToBounds = true
            self.containerView.layer.borderWidth = 0.5
            self.containerView.layer.borderColor = Pallete.textfieldBorderColor.cgColor
        }
    }
    @IBOutlet weak var playButton: EditControlButton!

    func setupAudio(url: URL) {
        
        do {
            self.avPlayer = try AVAudioPlayer(contentsOf: url)
        } catch {
            self.onDidError?("Проблема с загрузкой файла")
            return
        }

        self.scrollableWaveformView = SCScrollableWaveformView(frame: CGRect.init(x: 0, y: 0, width: self.contentView.frame.width + 20, height: self.contentView.frame.height - 20))
        let asset = AVAsset(url: url)
        scrollableWaveformView.waveformView.asset = asset
        scrollableWaveformView.waveformView.precision = 0.25; // We are going to render one line per four pixels

        scrollableWaveformView.waveformView.normalColor = Pallete.main
        scrollableWaveformView.waveformView.progressColor = Pallete.main

        // Set the play progress
        scrollableWaveformView.waveformView.progressTime = CMTimeMakeWithSeconds(1, preferredTimescale: 10000)

        // Show only the first second of your asset
        let duration = CMTime(seconds: self.avPlayer.duration, preferredTimescale: 1000000)
        scrollableWaveformView.waveformView.timeRange = CMTimeRangeMake(start: CMTime.zero, duration: duration)
        // Set the lineWidth so we have some space between the lines
        scrollableWaveformView.waveformView.lineWidthRatio = 0.5;

        // Show stereo if available
        scrollableWaveformView.waveformView.channelStartIndex = 0;
        scrollableWaveformView.waveformView.channelEndIndex = 0;
        self.contentView.addSubview(scrollableWaveformView)
    }
    
    @IBAction func onDidPlayTapped(_ sender: Any) {
        if self.avPlayer.isPlaying {
            self.avPlayer.stop()
            self.playButton.setImage(#imageLiteral(resourceName: "play"), for: .normal)
        } else {
            self.avPlayer.play()
            self.playButton.setImage(#imageLiteral(resourceName: "stop"), for: .normal)
        }
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
