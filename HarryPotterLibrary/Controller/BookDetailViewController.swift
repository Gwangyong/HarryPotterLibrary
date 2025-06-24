//
//  ViewController.swift
//  HarryPotterLibrary
//
//  Created by 서광용 on 6/13/25.
// MARK: - 메인 VC

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
        loadBooks(bookIndex: 0) // 처음 켜면 1번 책으로
    }
    
    // MARK: - BookDetailView 제약 조건
    private func setupBookDetailViewLayout() {
        bookDetailView.snp.makeConstraints {
            $0.directionalEdges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    // MARK: - 데이터 로딩
    private func loadBooks(bookIndex: Int) {
        bookLeader.loadBooks { [weak self] result in
            // self가 살아있는지 확인하고, 살아있을 때만 코드 실행하는 안전장치
            guard let self = self else { return }
            
            switch result {
            case .success(let books):
                let book = books[bookIndex] // 0번째 책
                configureBookDetail(with: book, index: bookIndex)
            case .failure(let error):
                DispatchQueue.main.async { // 메인 스레드에서 실행
                    self.showErrorAlert(message: error.localizedDescription)
                }
            }
        }
    }
    
    // configure
    private func configureBookDetail(with book: Book, index: Int) {
        bookDetailView.bookTitleView.configure(with: book) // Title
        bookDetailView.bookInfoView.configure(with: book, index: index) // Info
        bookDetailView.bookDedicationView.configure(with: book) // Dedication
        bookDetailView.bookSummaryView.configure(with: book, index: index) // Summary
        bookDetailView.bookChaptersView.configure(with: book) // Chapters
    }
    
    // seriesButton 눌림 액션
    @objc func seriesButtonTapped(_ button: UIButton) {
        let selectedIndex = button.tag
        loadBooks(bookIndex: selectedIndex)
    }
}
