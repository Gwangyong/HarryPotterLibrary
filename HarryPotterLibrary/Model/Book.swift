//
//  Book.swift
//  HarryPotterLibrary
//
//  Created by 서광용 on 6/16/25.
//

// MARK: - 책 데이터 구조 정의
struct BookResponse: Codable {
    let data: [BookData]
}

struct BookData: Codable {
    let attributes: Book
}

struct Book: Codable {
    let title: String
}
