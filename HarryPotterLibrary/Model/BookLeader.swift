//
//  BookLeader.swift
//  HarryPotterLibrary
//
//  Created by 서광용 on 6/16/25.
//

import Foundation

final class BookLeader {
    
    private enum DataError: Error {
        case fileNotFound
        case parsingFailed
    }
    
    // Success 자리에 [Book]이 들어감 -> 성공하면 책 배열을 반환
    // Failure 자리에 Error이 들어감 -> 실패하면 에러 객체 반환
    func loadBooks(completion: @escaping (Result<[Book], Error>) -> Void) {
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else {
            completion(.failure(DataError.fileNotFound))
            return
        }
        
        do {
            // String 타입의 path -> URL로 바꾸고 -> 그걸 Data로 바꿈
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let bookResponse = try JSONDecoder().decode(BookResponse.self, from: data)
            let books = bookResponse.data.map { $0.attributes }
            completion(.success(books))
        } catch {
            print("🚨 JSON 파싱 에러 : \(error)")
            completion(.failure(DataError.parsingFailed))
        }
    }
}
