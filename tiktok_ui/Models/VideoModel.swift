//
//  VideoModel.swift
//  tiktok_ui
//
//  Created by BOICOMP21070028 on 18/2/2565 BE.
//

import Foundation

struct VideoModel {
    var profileImage: String?
    var totalLike: Int?
    var totalComment: Int?
    var profileName: String?
    var content: String?
    var music: String?
    var totalShare: Int?
    var isLike: Bool?
    var video: String?
  
    init(jsonDic: Dictionary<String, Any>){
        self.profileImage = jsonDic["profileImage"] as? String
        self.totalLike = jsonDic["totalLike"] as? Int
        self.totalComment = jsonDic["totalComment"] as? Int
        self.profileName = jsonDic["profileName"] as? String
        self.content = jsonDic["content"] as? String
        self.music = jsonDic["music"] as? String
        self.totalShare = jsonDic["totalShare"] as? Int
        self.isLike = jsonDic["isLike"] as? Bool
        self.video = jsonDic["video"] as? String
    }
}

var videoList = [
    VideoModel(jsonDic: [
        "profileImage": "MicrosoftTeams-image (0)",
        "totalLike": 123,
        "totalComment": 456,
        "profileName": "ManekiMew",
        "content": "The cat whose anesthesia hasn’t disappeared is so cute 🥰",
        "music": "original sound - ManekiMew",
        "totalShare": 789,
        "isLike": false,
        "video": "video1"
    ]),
    VideoModel(jsonDic: [
        "profileImage": "MicrosoftTeams-image (1)",
        "totalLike": 123,
        "totalComment": 456,
        "profileName": "care_3294 เบาหวิว’เอง ❤️🦋",
        "content": "พี่บ่าวได้ยินนุ้ยม้าย #คนใต้ #fyp #tiktok #คนไทยเป็นคนตลก",
        "music": "เสียงต้นฉบับ - เบาหวิว’เอง ❤️🦋",
        "totalShare": 789,
        "isLike": false,
        "video": "video2"
    ]),
    VideoModel(jsonDic: [
        "profileImage": "MicrosoftTeams-image (2)",
        "totalLike": 123,
        "totalComment": 456,
        "profileName": "ads.who advertisement",
        "content": "kangen ci galak",
        "music": "original sound - advertisement",
        "totalShare": 789,
        "isLike": false,
        "video": "video3"
    ]),
    VideoModel(jsonDic: [
        "profileImage": "MicrosoftTeams-image (3)",
        "totalLike": 123,
        "totalComment": 456,
        "profileName": "testt",
        "content": "MicrosoftTeams-image (0)",
        "music": "asdasdasd",
        "totalShare": 789,
        "isLike": false,
        "video": "video4"
    ]),
    VideoModel(jsonDic: [
        "profileImage": "MicrosoftTeams-image (4)",
        "totalLike": 123,
        "totalComment": 456,
        "profileName": "testt",
        "content": "MicrosoftTeams-image (0)",
        "music": "asdasdasd",
        "totalShare": 789,
        "isLike": false,
        "video": "video5"
    ])
]
