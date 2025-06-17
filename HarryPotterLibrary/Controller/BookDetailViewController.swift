//
//  ViewController.swift
//  HarryPotterLibrary
//
//  Created by 서광용 on 6/13/25.
// MARK: 메인 VC

import SnapKit
import UIKit

final class BookDetailViewController: UIViewController {
    
    let dataService = DataService()
    let bookDetailView = BookDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(bookDetailView)
        
        setupBookDetailLayout() // BookDetailView
        loadBooks() // 데이터 불러오기
        setupTitleLayout() // 책 제목
        setupTopTabLayout() // 탭 버튼
    }
    
    
    // MARK: - BookDetailView 제약 조건
    private func setupBookDetailLayout() {
        bookDetailView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    // MARK: - 데이터 로딩
    func loadBooks() {
        dataService.loadBooks { [weak self] result in
            // self가 살아있는지 확인하고, 살아있을 때만 코드 실행하는 안전장치
            guard let self = self else { return }
            
            switch result {
            case .success(let books):
                // 첫 번째 책 제목 표시
                bookDetailView.bookTitleView.setTitle(books[0].title)
            case .failure(let error):
                // 메인 스레드에서 실행
                DispatchQueue.main.async {
                    self.showErrorAlert(message: error.localizedDescription)
                }
            }
        }
    }
}
