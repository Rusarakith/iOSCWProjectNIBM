//
//  FlashScreenViewController.swift
//  GymMasterPro
//
//  Created by Rusara Kithsahan on 2023-03-06.
//

import UIKit
import AVFoundation

class FlashScreenViewController: UIViewController {
    
    var player : AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setupConstraints()

        playVideo()
        // Do any additional setup after loading the view.
    }
    
//    let label : UILabel = {
//        let name = UILabel()
//        name.translatesAutoresizingMaskIntoConstraints = false
//        name.font = .systemFont(ofSize: 24, weight: .semibold)
//        //name.backgroundColor = .systemGreen
//        name.textAlignment = .center
//        name.center = .zero
//        name.text = "Rusara Kithsahan"
//
//        return name
//    }()
    
    let logoImage : UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "logoWhite")
        logo.setRounded()
        
        return logo
    }()
    
    let nameImage : UIImageView = {
        let name = UIImageView()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.image = UIImage(named: "nameImage")
        
        return name
    }()
    
    func playVideo(){
        let path = Bundle.main.path(forResource: "gymExerciseClip", ofType: "mp4")
        player = AVPlayer(url: URL(fileURLWithPath: path!))
        player!.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.frame
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.view.layer.insertSublayer(playerLayer, at: 0)
        //self.view.addSubview(label)
        //self.view.addSubview(nameImage)
        //self.view.addSubview(logoImage)
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player!.currentItem)
        player!.seek(to: CMTime.zero)
        player!.play()
        self.player?.isMuted = true
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
            self.animateLogo()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5){
            self.animateNameLogo()
        }
        
        
    }
    
    func animateLogo(){
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 1
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        self.view.addSubview(logoImage)
        logoImage.layer.add(animation, forKey: nil)
        
        setupLogoConstraints()
    }
    
    func animateNameLogo(){
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 1.5
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        self.view.addSubview(nameImage)
        nameImage.layer.add(animation, forKey: nil)
        
        setupNameConstraints()
    }
    
    @objc func playerItemDidReachEnd(){
        player!.seek(to: CMTime.zero)
    }
    
    func setupLogoConstraints() {
        
//        label.leadingAnchor.constraint(equalTo:view.leadingAnchor).isActive=true
//        label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive=true
//        label.topAnchor.constraint(equalTo: view.topAnchor).isActive=true
//        label.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive=true

        logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        logoImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -650 ).isActive = true
        logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150).isActive = true
        logoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -130).isActive = true
    }
    
    func setupNameConstraints(){
        nameImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 240).isActive = true
        nameImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -630 ).isActive = true
//        nameImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        nameImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50 ).isActive = true
        nameImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 65).isActive = true
        nameImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -65).isActive = true
    }
    
}

extension UIImageView{
    func setRounded(){
        let radius = CGRectGetWidth(self.frame) / 2
        layer.cornerRadius = radius
        layer.masksToBounds = false
        clipsToBounds = true
    }
}
