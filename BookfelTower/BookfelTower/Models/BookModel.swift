//
//  BookModel.swift
//  BookfelTower
//
//  Created by Alex Cho on 2023/05/10.
//

import Foundation

struct BookModel: Identifiable{
    var id: String
    let title: String
    let coverUrl: String
    let author: String
    let description: String
    let publisher: String
    let isbn: String
    let pageNumber: String
    let readingStatus: readStatus?
    let startDate: Date?
    let endDate: Date?
    let rating: Int
}


struct HomeBookModel: Identifiable{
    var id: String
    let title: String
    let pageNumber: String
}


enum readStatus{
    case isDone
    case isReading
    case isToRead
}

//Function for Home books.
// select id title pageNumber from BookBanks where readingStatus == isDone. -> [[id:1,title:little prince, pageNumber: 200],[....],[....]]

//Function for DetailPage
//Select * from BookBanks where id == 1 ->
//[id: "1",
//title: "Mock Book 1",
//coverUrl: "https://url.kr/7wozp6",
//author: "John Smith",
//description: "Mock description for book 1 Mock description for book 1 Mock description for book 1 Mock description for book 1 Mock description for book 1",
//publisher: "Mock Publisher",
//isbn: "9781234567890",
//pageNumber: "200",
//readingStatus: .isDone,
//startDate: dateFormatter.date(from: "2023-01-01"),
//endDate: dateFormatter.date(from: "2023-01-15"),
//rating: 4]


//Generate mock data for home
func generateHomeMockBooks() -> [HomeBookModel] {
    return [
        HomeBookModel(id: "1", title: "Mock Book 1", pageNumber: "200"),
        HomeBookModel(id: "2", title: "Mock Book 2", pageNumber: "200"),
        HomeBookModel(id: "3", title: "Mock Book 3", pageNumber: "200")
    ]
}

//Generate mock data for detail
func generateDetailMockBook(id: String) -> BookModel {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    
    return BookModel(
        id: "1",
        title: "Mock Book 1",
        coverUrl: "https://url.kr/7wozp6",
        author: "John Smith",
        description: "Mock description for book 1 Mock description for book 1 Mock description for book 1 Mock description for book 1 Mock description for book 1",
        publisher: "Mock Publisher",
        isbn: "9781234567890",
        pageNumber: "200",
        readingStatus: .isDone,
        startDate: dateFormatter.date(from: "2023-01-01"),
        endDate: dateFormatter.date(from: "2023-01-15"),
        rating: 4
    )
}


// Generate mock data
func generateLibraryMockBooks() -> [BookModel] {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    
    let book1 = BookModel(
        id: "1",
        title: "Mock Book 1",
        coverUrl: "https://url.kr/nmzv2r",
        author: "John Smith",
        description: "Mock description for book 1 Mock description for book 1 Mock description for book 1 Mock description for book 1 Mock description for book 1",
        publisher: "Mock Publisher",
        isbn: "9781234567890",
        pageNumber: "200",
        readingStatus: .isDone,
        startDate: dateFormatter.date(from: "2023-01-01"),
        endDate: dateFormatter.date(from: "2023-01-15"),
        rating: 4
    )
    
    let book2 = BookModel(
        id: "2",
        title: "Mock2",
        coverUrl: "https://url.kr/7wozp6",
        author: "Jane Doe",
        description: "Mock ",
        publisher: "Mock Publisher",
        isbn: "9780987654321",
        pageNumber: "300",
        readingStatus: .isReading,
        startDate: dateFormatter.date(from: "2023-02-01"),
        endDate: nil,
        rating: 0
    )
    
    let book3 = BookModel(
        id: "3",
        title: "Mock Book 3",
        coverUrl: "https://url.kr/nmzv2r",
        author: "David Johnson",
        description: "Mock description for book 3",
        publisher: "Mock Publisher",
        isbn: "9785432167890",
        pageNumber: "150",
        readingStatus: .isToRead,
        startDate: nil,
        endDate: nil,
        rating: 0
    )
    
    let book4 = BookModel(
        id: "4",
        title: "Mock Book 4",
        coverUrl: "https://url.kr/7wozp6",
        author: "Jane Doe",
        description: "Mock description for book 2 Mock description for book 1 Mock description for book 1 Mock description for book 1 Mock description for book 1 Mock description for book 1",
        publisher: "Mock Publisher",
        isbn: "9780987654321",
        pageNumber: "300",
        readingStatus: .isReading,
        startDate: dateFormatter.date(from: "2023-02-01"),
        endDate: nil,
        rating: 0
    )
    
    return [book1, book2, book3, book4]
}
