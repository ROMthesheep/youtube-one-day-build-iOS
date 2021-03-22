//
//  model.swift
//  yt-otb
//
//  Created by Rom on 22/03/2021.
//

import Foundation

class Model {
    func getVideos() {
        
        // create URL
        let url = URL(string: Constants.API_URL)
        
        guard url != nil
        else{
            return
        }
        
        // Get a URLSession
        let session = URLSession.shared
        // Get data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            // check error
            if error != nil || data == nil {
                return
            }
            
            // parsing into video
            
        }
        // kick off the task
        dataTask.resume()
    }
}
