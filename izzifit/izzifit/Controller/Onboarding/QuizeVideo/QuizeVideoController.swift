//
//  QuizeVideoController.swift
//  izzifit
//
//  Created by Andrey S on 03.06.2022.
//

import UIKit
import AVFoundation

protocol QuizeVideoPotocol: AnyObject {
    func quizeVideoEnd(contoller: QuizeVideoController)
}

class QuizeVideoController: BaseController {

    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var videoView: UIView!
    
    //----------------------------------------------
    // MARK: - Propety
    //----------------------------------------------
    
    private var player: AVPlayer?
    private var playerLayer: AVPlayerLayer!
    weak var delegate: QuizeVideoPotocol?
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(delegate: QuizeVideoPotocol) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playerLayer.frame = videoView.bounds
    }
    
    override func viewDidLoad() {
        hiddenNavigationBar = true
        
        super.viewDidLoad()
        setup()
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        guard let path = Bundle.main.path(forResource: "IzziFit_coinmaster_30s", ofType:"mp4") else {
                    debugPrint("IzziFit_coinmaster_30s.mp4 not found")
                    return
                }
        
        player = AVPlayer(url: URL(fileURLWithPath: path))
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resize
        
        videoView.layer.addSublayer(playerLayer)
        
        player?.play()
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: .AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
    //----------------------------------------------
    // MARK: - Notifications
    //----------------------------------------------
    
    @objc func playerDidFinishPlaying(notification: NSNotification) {
        player = nil
        NotificationCenter.default.removeObserver(self)
        dismiss(animated: false)
        self.delegate?.quizeVideoEnd(contoller: self)
    }
    
    //----------------------------------------------
    // MARK: - Notifications
    //----------------------------------------------
    
    @IBAction func actionClose(_ sender: UIButton) {
        player = nil
        NotificationCenter.default.removeObserver(self)
        dismiss(animated: false)
        self.delegate?.quizeVideoEnd(contoller: self)
    }
}
