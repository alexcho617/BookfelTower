//
//  BookRealmModel.swift
//  BookfelTower
//
//  Created by Alex Cho on 2023/07/18.
//

import Foundation
import RealmSwift

enum RealmReadStatus: String, PersistableEnum{
    case done
    case reading
    case willRead
}

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
    
    @Persisted var readingStatus: RealmReadStatus?
    @Persisted var startDate: Date?
    @Persisted var endDate: Date?
    @Persisted var rating: Int
    @Persisted var currentReadingPage: Int
    @Persisted var expectScore: Int
    
    convenience init(title: String, ownerId: String, coverUrl: String, author: String, descriptionOfBook: String, publisher: String, isbn: String, pageNumber: String, startDate: Date? = nil, endDate: Date? = nil, rating: Int, currentReadingPage: Int, expectScore: Int) {
        self.init()
        self.title = title
        self.ownerId = ownerId
        self.coverUrl = coverUrl
        self.author = author
        self.descriptionOfBook = descriptionOfBook
        self.publisher = publisher
        self.isbn = isbn
        self.pageNumber = pageNumber
        self.startDate = startDate
        self.endDate = endDate
        self.rating = rating
        self.currentReadingPage = currentReadingPage
        self.expectScore = expectScore
    }
}




//struct HomeBookModel: Identifiable{
//    var id: String
//    let title: String
//    let pageNumber: String
//}
//
//
