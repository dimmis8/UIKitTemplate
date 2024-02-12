// PlayerViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFAudio
import UIKit

/// вью контроллера плеера
class PlayerViewController: UIViewController {
    private var player = AVAudioPlayer()
    @IBOutlet var playButtonOutlet: UIButton!
    @IBOutlet var slider: UISlider!

    override func viewDidLoad() {
        do {
            if let audioPath = Bundle.main.path(forResource: "beatlesLetItBe", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            }
        } catch {
            print("Error")
        }
        slider.maximumValue = Float(player.duration)
    }

    @IBAction func playButton(_ sender: Any) {
        if player.isPlaying {
            player.pause()
            playButtonOutlet.setImage(UIImage(named: "playPouse"), for: .normal)
        } else {
            player.play()
            playButtonOutlet.setImage(UIImage(named: "pause"), for: .normal)
        }
    }

    @IBAction func playerSlider(_ sender: Any) {
        player.currentTime = TimeInterval(slider.value)
    }
}
