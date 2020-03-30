//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func playSound2() {
        guard let url = Bundle.main.url(forResource: "C", withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func playSound(note: String) {
        let url = Bundle.main.url(forResource: note, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
        
        
    }
    
    
    @IBAction func keyPressed(_ sender: UIButton) {
      
//        //case1
//        switch sender.tag {
//        case 1:
//            playSound(note: "C")
//            break
//        case 2:
//            playSound(note: "D")
//            break
//        case 3:
//            playSound(note: "E")
//            break
//        case 4:
//            playSound(note: "F")
//            break
//        case 5:
//            playSound(note: "G")
//            break
//        case 6:
//            playSound(note: "A")
//            break
//        case 7:
//            playSound(note: "B")
//            break
//
//        default:
//            break
//        }
        
        //case2
        sender.alpha = 0.5
        print("START")
        playSound(note: sender.currentTitle!)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
          print("END")
          sender.alpha = 1.0
      }
    }
    
    
    
    
    
}

