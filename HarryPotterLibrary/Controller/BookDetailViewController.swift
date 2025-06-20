//
//  ViewController.swift
//  HarryPotterLibrary
//
//  Created by 서광용 on 6/13/25.
// MARK: 메인 VC

import UIKit
import SnapKit

final class BookDetailViewController: UIViewController {
    
    let bookLeader = BookLeader()
    let bookDetailView = BookDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(bookDetailView)
        
        setupBookDetailViewLayout()
        loadBooks()
    }
    
    // MARK: - BookDetailView 제약 조건
    private func setupBookDetailViewLayout() {
        bookDetailView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    // MARK: - 데이터 로딩
    private func loadBooks() {
        bookLeader.loadBooks { [weak self] result in
            // self가 살아있는지 확인하고, 살아있을 때만 코드 실행하는 안전장치
            guard let self = self else { return }
            
            switch result {
            case .success(let books):
                // 첫 번째 책 제목 표시
                let index = 0
                let book = books[index]
                bookDetailView.bookTitleView.configure(with: book)
                bookDetailView.bookInfoView.configure(with: book, index: index)
                bookDetailView.bookDedicationView.configure(with: book)
                bookDetailView.bookSummaryView.configure(with: book)
            case .failure(let error):
                // 메인 스레드에서 실행
                DispatchQueue.main.async {
                    self.showErrorAlert(message: error.localizedDescription)
                }
            }
        }
    }
}

// MARK: - #Preview 사용
import SwiftUI

struct BookDetailViewControllerPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> BookDetailViewController {
        return BookDetailViewController()
    }

    func updateUIViewController(_ uiViewController: BookDetailViewController, context: Context) {
        // 업데이트 로직은 필요하지 않음
    }
}

#Preview {
    BookDetailViewControllerPreview()
}
