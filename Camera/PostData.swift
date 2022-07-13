//
//  PostData.swift
//  Camera
//
//  Created by 新宅雄介 on 2022/07/13.
//
import Firebase
import UIKit

class PostData: NSObject {
    var id: String
    var title: String?
    var genre: String?
    var original: String?
    var date: Date?
    var comments: [String] = []
    
    init(document: QueryDocumentSnapshot) {
       self.id = document.documentID
    
        let postDic = document.data()
    
        self.title = postDic["title"] as? String
    
        self.genre = postDic["genre"] as? String
        
        self.original = postDic["original"] as? String
    
        let timestamp = postDic["date"] as? Timestamp
        self.date = timestamp?.dateValue()
    
        if let comments = postDic["comments"] as? [String] {
            self.comments = comments
        }
    }
    

}
