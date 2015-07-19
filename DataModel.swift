//
//  DataModel.swift
//  Glyph
//
//  Created by Anwar Baroudi on 6/21/15.
//  Copyright (c) 2015 Paige Plander. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class DataModel {
    var imageData: [UIImage]
    var labelData: [String]
    let speaker: AVSpeechSynthesizer
    var count: Int
    
    init() {
        imageData = []
        labelData = []
        speaker = AVSpeechSynthesizer()
        count = 0
    }
    
    func isEmpty() -> Bool {
        return imageData.count == 0
    }
    
    func getImage(index: Int) -> UIImage {
        return imageData[index]
    }
    
    func getLabel(index: Int) -> String {
        if labelData.isEmpty {
            return "nil"
        }
        return labelData[index]
    }
    
    func add(image: UIImage, label: String) {
        imageData.append(image)
        labelData.append(label)
        count += 1
    }
    
    func remove(index: Int) {
        imageData.removeAtIndex(index)
        labelData.removeAtIndex(index)
        count -= 1
    }
    
    func speakAtIndex(index: Int) {
        let speech = AVSpeechUtterance(string: labelData[index])
        speech.rate = 0.1
        speaker.speakUtterance(speech)
    }
    
}
