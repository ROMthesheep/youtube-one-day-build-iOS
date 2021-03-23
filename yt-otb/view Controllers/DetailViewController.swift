//
//  DetailViewController.swift
//  yt-otb
//
//  Created by Rom on 23/03/2021.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textView: UITextView!
    
    var video:Video?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // clear the fields
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        //check video info
        guard video != nil else{
            return
        }
        // create embeded url
        let embedURL = Constants.YT_EMBED_URL + video!.videoId
        // load url to webkit view
        print(embedURL)
        let request = URLRequest(url: URL(string: embedURL)!)
        webView.load(request)
        // set title
        titleLabel.text = video!.title
        // set date
        let df = DateFormatter()
        df.dateFormat = Constants.DATE_FORMAT
        dateLabel.text = df.string(from: video!.published)
        // set description
        textView.text = video!.description
    }
    

}
