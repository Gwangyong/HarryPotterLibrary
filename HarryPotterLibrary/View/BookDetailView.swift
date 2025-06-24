//
//  BookDetailView.swift
//  HarryPotterLibrary
//
//  Created by 서광용 on 6/17/25.
// MARK: - 전체 View 컨테이너 (스크롤뷰 + 콘텐츠뷰 + 스택뷰)

import UIKit
import SnapKit

final class BookDetailView: UIView {
    private let bookScrollView = UIScrollView()
    private let scrollContentView = UIView()
    private let bookContentStackView = UIStackView()
    
    let bookTitleView = BookTitleView(frame: .zero)
    let bookTopTabView = BookTopTabView(frame: .zero)
    let bookInfoView = BookInfoView(frame: .zero)
    let bookDedicationView = BookDedicationView(frame: .zero)
    let bookSummaryView = BookSummaryView(frame: .zero)
    let bookChaptersView = BookChaptersView(frame: .zero)
    
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
        // BookDetailView의 subview 추가
        [bookTitleView, bookTopTabView, bookScrollView].forEach {
            addSubview($0)
        }
        
        bookScrollView.addSubview(scrollContentView)
        scrollContentView.addSubview(bookContentStackView)
        
        // bookContentStackView 내부 arrangedSubview 추가
        [bookInfoView, bookDedicationView, bookSummaryView, bookChaptersView].forEach {
            bookContentStackView.addArrangedSubview($0)
        }
    }
    
    // MARK: - 제약조건 설정
    private func setupLayout() {
        setupBookTitleViewLayout()
        setupBookTopTabViewLayout()
        setupBookScrollViewLayout()
        setupScrollContentViewLayout()
        setupBookContentStackViewLayout()
    }
    
    // bookTitleView
    private func setupBookTitleViewLayout() {
        bookTitleView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    // bookTopTabView
    private func setupBookTopTabViewLayout() {
        bookTopTabView.snp.makeConstraints {
            $0.top.equalTo(bookTitleView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    // bookScrollView
    private func setupBookScrollViewLayout() {
        // 세로 스크롤 바가 보이지 않도록 구현
        bookScrollView.showsVerticalScrollIndicator = false
        
        bookScrollView.snp.makeConstraints {
            $0.top.equalTo(bookTopTabView.snp.bottom).offset(16)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide).inset(20)
            $0.bottom.equalToSuperview()
        }
        
        // 세로 스크롤만 허용
        bookScrollView.contentLayoutGuide.snp.makeConstraints {
            $0.width.equalTo(bookScrollView.frameLayoutGuide)
        }
    }
    
    //scrollContentView
    private func setupScrollContentViewLayout() {
        scrollContentView.snp.makeConstraints {
            $0.directionalEdges.equalTo(bookScrollView.contentLayoutGuide)
        }
    }
    
    // bookContentStackView
    private func setupBookContentStackViewLayout() {
        // bookContentStackView 세부 설정
        bookContentStackView.axis = .vertical
        bookContentStackView.spacing = 24 // 하위 View들 사이 간격을 24로 설정
        
        bookContentStackView.snp.makeConstraints {
            $0.directionalEdges.equalToSuperview()
        }
    }
}
