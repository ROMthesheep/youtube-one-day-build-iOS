//
//  ViewController.swift
//  yt-otb
//
//  Created by Rom on 22/03/2021.
//

import UIKit

class ViewController: UIViewController,
                      UITableViewDataSource,
                      UITableViewDelegate,
                      ModelDelegate{

    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        model.delegate = self
        
        model.getVideos()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // confirm that a video was selected
        guard tableView.indexPathForSelectedRow != nil else{
            return
        }
        // get reference to video
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        // get reference to detail VC
        let detailVC = segue.destination as! DetailViewController
        // set video property of the detail VC
        detailVC.video = selectedVideo
    }
    
    //MARK: Model Delegate
    
    func videosFeched(_ videos: [Video]) {
        //Set the local video property
        self.videos = videos
        
        //refresh the table
        tableView.reloadData()
    }
    
    //MARK: TableView Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        //configure the cell
        let video = self.videos[indexPath.row]
        cell.setCell(video)
        
        //return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

