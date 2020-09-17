//
//  Podcast.swift
//  vk-podcast
//
//  Created by Александр on 17.09.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit

struct Podcast {

    var title: String
    var description: String
    var image: UIImage
    var url: URL
    var timecodes: [Timecode] = []
}

struct Timecode {
    var name: String
    var interval: Int
}
