//
//  Constants.swift
//  yt-otb
//
//  Created by Rom on 22/03/2021.
//

import Foundation

struct Constants {
    static var API_KEY = "AIzaSyAX0BgQYY38jOiXxd_1I9DkIjsj2yXBVKw"
    static var PLAYLIST_ID = "PLhLoPqe8mCOJSTc7UJN6Z5crwCDoCcfMN"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}
