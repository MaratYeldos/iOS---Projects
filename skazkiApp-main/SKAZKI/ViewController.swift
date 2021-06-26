//
//  ViewController.swift
//  SKAZKI
//
//  Created by Family on 10.04.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var teremokButton: UIButton!
    @IBOutlet weak var kolobokButton: UIButton!
    @IBOutlet weak var kurochkaButton: UIButton!
    @IBOutlet weak var mashaButton: UIButton!
    
    //MARK: - Variables
    var player: AVAudioPlayer?
    var skazka: String = ""
    
    //MARK: - LifeCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let teremokImg = UIImage(named: "teremok")
        teremokButton.setImage(teremokImg?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        teremokButton.layer.cornerRadius = 10
        
        let kolobokImg = UIImage(named: "kolobok")
        kolobokButton.setImage(kolobokImg?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        kolobokButton.layer.cornerRadius = 10
        
        let ryabaImg = UIImage(named: "Ryaba")
        kurochkaButton.setImage(ryabaImg?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        kurochkaButton.layer.cornerRadius = 10
        
        let mashaImg = UIImage(named: "masha")
        mashaButton.setImage(mashaImg?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        mashaButton.layer.cornerRadius = 10
        
    }
    
    //MARK: - IBActions
    @IBAction func tapButton(_ sender: Any) {
        
        let tag = (sender as? UIButton)?.tag
        
        if tag == 1 {
            skazka = "teremok"
            playSound()
        } else if tag == 2 {
            skazka = "kolobok"
            playSound()
        } else if tag == 3 {
            skazka = "kurochka"
            playSound()
        } else if tag == 4 {
            skazka = "mashenka"
            playSound()
        }
        
        if let filePath = Bundle.main.url(forResource: "\(skazka)", withExtension: "mp3") {
            print(filePath)
        }
    }
    
    //MARK: - Private functions
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: String(skazka), withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let aPlayer = player else { return }
            aPlayer.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
}
