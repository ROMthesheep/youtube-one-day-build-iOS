//
//  ViewController.swift
//  yt-otb
//
//  Created by Rom on 22/03/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
    }


}

