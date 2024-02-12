// PlayerViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFAudio
import UIKit

/// вью контроллера плеера
class PlayerViewController: UIViewController {
    private var player = AVAudioPlayer()
    @IBOutlet var volumeSlider: UISlider!
    @IBOutlet var playButtonOutlet: UIButton!
    @IBOutlet var slider: UISlider!
    @IBOutlet var timeLabel: UILabel!
    var timer: Timer?

    override func viewDidLoad() {
        volumeSlider.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi / 2))
        do {
            if let audioPath = Bundle.main.path(forResource: "beatlesLetItBe", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                slider.maximumValue = Float(player.duration)
            }
        } catch {
            print("Error")
        }
        timer = Timer.scheduledTimer(
            timeInterval: 0.1,
            target: self,
            selector: #selector(updateSlider),
            userInfo: nil,
            repeats: true
        )
        player.play()
        playButtonOutlet.setImage(UIImage(named: "pause"), for: .normal)
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

    @IBAction func sliderAction(_ sender: Any) {
        player.volume = volumeSlider.value
    }

    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        player.pause()
    }

    @objc func updateSlider() {
        slider.value = Float(player.currentTime)
        let remainingTime = player.duration - player.currentTime
        let minutes = Int(remainingTime) / 60
        let seconds = Int(remainingTime) % 60
        timeLabel.text = "-\(String(format: "%02d:%02d", minutes, seconds))"
    }
}
