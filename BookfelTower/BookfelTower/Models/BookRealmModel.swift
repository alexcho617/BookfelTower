//
//  BookRealmModel.swift
//  BookfelTower
//
//  Created by Alex Cho on 2023/07/18.
//

import Foundation
import RealmSwift

class Book: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var title: String = ""
    @Persisted var ownerId: String
    @Persisted var coverUrl: String = ""
    @Persisted var author: String = ""
    @Persisted var descriptionOfBook: String
    @Persisted var publisher: String
    @Persisted var isbn: String
    @Persisted var pageNumber: String
    
//    @Persisted var readingStatus: RealmReadStatus?
    @Persisted var startDate: Date?
    @Persisted var endDate: Date?
    @Persisted var rating: Int
    @Persisted var currentReadingPage: Int
    @Persisted var expectScore: Int
    
//    convenience init(name: String, ownerId: String) {
//        self.init()
//        self.ownerId = ownerId
//    }
}
enum RealmReadStatus{
    case done
    case reading
    case willRead
}



//struct HomeBookModel: Identifiable{
//    var id: String
//    let title: String
//    let pageNumber: String
//}
//
//
