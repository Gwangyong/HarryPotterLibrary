//
//  BookDetailView.swift
//  HarryPotterLibrary
//
//  Created by 서광용 on 6/17/25.
// MARK: 전체 View 컨테이너 (스크롤뷰 + 콘텐츠뷰 + 스택뷰)

import UIKit
import SnapKit

final class BookDetailView: UIView {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let stackView = UIStackView()
    
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
        [bookTitleView, bookTopTabView, scrollView].forEach {
            addSubview($0)
        }
        
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        
        // stackView 내부 arrangedSubview 추가
        [bookInfoView, bookDedicationView, bookSummaryView, bookChaptersView].forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    // MARK: - 제약조건 설정
    private func setupLayout() {
        setupBookTitleViewLayout()
        setupBookTopTabViewLayout()
        setupScrollViewLayout()
        setupContentViewLayout()
        setupStackViewLayout()
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
    
    // scrollView
    private func setupScrollViewLayout() {
        // 스크롤 바가 보이지 않도록 구현
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(bookTopTabView.snp.bottom).offset(16)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide).inset(20)
            $0.bottom.equalToSuperview()
            $0.width.equalTo(scrollView.contentLayoutGuide) // 가로 고정
        }
    }
    
    //contentView
    private func setupContentViewLayout() {
        contentView.snp.makeConstraints {
            $0.directionalEdges.equalTo(scrollView.contentLayoutGuide)
        }
    }
    
    // stackView
    private func setupStackViewLayout() {
        // stackView 세부 설정
        stackView.axis = .vertical
        stackView.spacing = 24 // 하위 View들 사이 간격을 24로 설정
        
        stackView.snp.makeConstraints {
            $0.directionalEdges.equalToSuperview()
        }
    }
}
