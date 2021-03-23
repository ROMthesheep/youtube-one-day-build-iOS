//
//  model.swift
//  yt-otb
//
//  Created by Rom on 22/03/2021.
//

import Foundation

protocol ModelDelegate {
    func videosFeched(_ videos:[Video])
}

class Model {
    
    var delegate: ModelDelegate?
    
    
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
            
            do{
                // parsing into video
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                dump(response)
                
                if response.items != nil{
                    
                    DispatchQueue.main.async {
                        //call videosFeched method
                        self.delegate?.videosFeched(response.items!)
                    }
                
                }
            }
            catch{
                print("oh no")
            }
        }
        // kick off the task
        dataTask.resume()
    }
}
