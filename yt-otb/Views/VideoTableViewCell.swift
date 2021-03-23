//
//  VideoTableViewCell.swift
//  yt-otb
//
//  Created by Rom on 23/03/2021.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnaiilImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video){
        self.video = v
        
        guard self.video != nil else {
            return
        }
        
        self.titleLabel.text = video?.title
        
        let df = DateFormatter()
        df.dateFormat = Constants.DATE_FORMAT
        self.dataLabel.text = df.string(from: video!.published)
        
        // set the thumbnail
        
        guard self.video?.thumbnail != "" else {
            return
        }
        
        // check cache
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail){
            self.thumbnaiilImageView.image = UIImage(data: cachedData)
            return
        }
        
        // download the thumbnail
        let url = URL(string: self.video!.thumbnail)
        let sesssion = URLSession.shared
        let dataTask = sesssion.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                // save data in cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                // check the url maches the video thumbnail
                if url?.absoluteString != self.video?.thumbnail {
                    return
                }
                // create the image obj
                let image = UIImage(data: data!)
                
                // set the imageview
                DispatchQueue.main.async {
                    self.thumbnaiilImageView.image = image
                }
            }
        }
        
        // launch task
        dataTask.resume()
        
    }

}
