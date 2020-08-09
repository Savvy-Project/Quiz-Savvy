//
//  AudioPlayer.swift
//  Quiz Savvy
//
//  Created by 青木智大 on 2020/08/09.
//  Copyright © 2020 青木智大. All rights reserved.
//

import Foundation
import Combine
import AVFoundation

class AudioPlayer: ObservableObject {
    var audio: AVAudioPlayer!
    @Published var userName = ""

    init() {
        let path = Bundle.main.path(forResource: userName, ofType: "mp3")
        do {
            self.audio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
        } catch {
            print( "Could not find the file")
        }
        
        
    }

    func playAudio() {
        audio.play()
    }

    func pauseAudio() {
        audio.pause()
    }

    func stopAudio() {
        audio.stop()
        audio.currentTime = 0
    }
}

