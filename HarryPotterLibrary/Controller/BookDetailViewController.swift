//
//  ViewController.swift
//  HarryPotterLibrary
//
//  Created by 서광용 on 6/13/25.
// MARK: 메인 VC
import SnapKit
import UIKit

class BookDetailViewController: UIViewController {
    
    let dataService = DataService()
    let bookTitleView = BookTitleView(frame: .zero)
    let bookTopTabView = BookTopTabView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        [bookTopTabView, bookTitleView].forEach {
            view.addSubview($0)
        }
        
        loadBooks() // 데이터 불러오기
        setupTitleLayout() // 책 제목
        setupTopTabLayout() // 탭 버튼
    }
    
    func loadBooks() {
        dataService.loadBooks { [weak self] result in
            // self가 살아있는지 확인하고, 살아있을 때만 코드 실행하는 안전장치
            guard let self = self else { return }
            
            switch result {
            case .success(let books):
                // 첫 번째 책 제목 표시
                self.bookTitleView.setTitle(books[0].title)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
