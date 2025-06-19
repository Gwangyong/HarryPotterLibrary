//
//  BookDetailView.swift
//  HarryPotterLibrary
//
//  Created by 서광용 on 6/17/25.
// MARK: 전체 View 컨테이너 (스크롤뷰 + 스택뷰)

import SnapKit
import UIKit

final class BookDetailView: UIView {
    private let stackView = UIStackView()
    
    let bookTitleView = BookTitleView(frame: .zero)
    let bookTopTabView = BookTopTabView(frame: .zero)
    let bookInfoView = BookInfoView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 뷰 계층 구성
    private func setupUI() {
        [bookTitleView, bookTopTabView, stackView].forEach {
            addSubview($0)
        }
            
        // stackView 세부 설정
        stackView.axis = .vertical // 세로 방향
        stackView.spacing = 16 // 하위 View들 사이 간격을 16으로 설정
        stackView.addArrangedSubview(bookInfoView)
    }
    
    // MARK: - 제약조건 설정
    private func setupLayout() {
        // bookTitleView
        bookTitleView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        // bookTopTabView
        bookTopTabView.snp.makeConstraints {
            $0.top.equalTo(bookTitleView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
        }
        
        // InfoView가 들어간 stackView
        stackView.snp.makeConstraints {
            $0.top.equalTo(bookTopTabView.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide)
        }
    }
}
