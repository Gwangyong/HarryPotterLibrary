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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [bookTopTabView, bookTitleView, stackView].forEach {
            addSubview($0)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
