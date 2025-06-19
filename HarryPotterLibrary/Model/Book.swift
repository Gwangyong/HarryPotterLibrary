//
//  Book.swift
//  HarryPotterLibrary
//
//  Created by 서광용 on 6/16/25.
//

// MARK: - 책 데이터 구조 정의
// data 배열 포함
struct BookResponse: Codable {
    let data: [BookData]
}

// data 배열 내 각 요소 (attributes 포함)
struct BookData: Codable {
    let attributes: Book
}

// 실제 책 정보를 담음 (title 등 실제 속성)
struct Book: Codable {
    let title: String
    let author: String
    let pages: Int
    let releaseDate: String
    let dedication: String
    let summary: String
    
    enum CodingKeys: String, CodingKey {
        case title, author, pages, dedication, summary
        case releaseDate = "release_date"
    }
}
