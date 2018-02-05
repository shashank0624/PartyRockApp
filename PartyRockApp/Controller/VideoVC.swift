//
//  VideoVC.swift
//  PartyRockApp
//
//  Created by Kirti Ahlawat on 03/02/18.
//  Copyright © 2018 xyz. All rights reserved.
//

import UIKit
import WebKit

class VideoVC: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var titleLbl: UILabel!
    
    private var _partyRock : PartyRock!
    
    var partyRock: PartyRock{
        get{
            return _partyRock
        } set {
            _partyRock = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.text = partyRock.videoTitle
        webView.loadHTMLString(partyRock.videoURL, baseURL: nil)
        
    }

}
