//
//  Post.swift
//  UI-122
//
//  Created by にゃんにゃん丸 on 2021/02/09.
//

import SwiftUI

struct post : Identifiable {
    var id = UUID().uuidString
    var user : String
    var profile : String
    var postImage : String
    var postTitle : String
    var time : String
    
}

var posts = [
    
    post(user: "にゃん", profile: "p1", postImage: "po1", postTitle: "rever", time: "18 min ago"),
    post(user: "青春中", profile: "p2", postImage: "po2", postTitle: "A", time: "60 min ago"),
    post(user: "Jump", profile: "p3", postImage: "po3", postTitle: "house", time: "120 min ago"),
    post(user: "えさは？", profile: "p4", postImage: "po4", postTitle: "Night", time: "3 min ago"),
    post(user: "爆睡中", profile: "p5", postImage: "po5", postTitle: "B", time: "58 min ago"),
    
    
]
