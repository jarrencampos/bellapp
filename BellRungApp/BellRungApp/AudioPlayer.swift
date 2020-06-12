//
//  AudioPlayer.swift
//  BellRungApp
//
//  Created by Jarren Campos on 6/11/20.
//  Copyright © 2020 Jarren Campos. All rights reserved.
//

import Foundation
import AVFoundation

class AudioPlayer {
    var player: AVAudioPlayer?

    func playBellSound() {
        let path = Bundle.main.path(forResource: "bell.wav", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("couldn't load file")
        }
    }
}
