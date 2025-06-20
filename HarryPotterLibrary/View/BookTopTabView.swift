//
//  BookListViewController.swift
//  HarryPotterLibrary
//
//  Created by 서광용 on 6/16/25.
// MARK: 책 시리즈 탭(1~7) view

import UIKit
import SnapKit

final class BookTopTabView: UIView {

    private let seriesButton = UIButton()
    
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
        addSubview(seriesButton)
    }
    
    // MARK: - 제약조건 설정
    private func setupLayout() {
        seriesButton.setTitle("1", for: .normal) // 우선은 하드코딩
        seriesButton.titleLabel?.font = .systemFont(ofSize: 16)
        seriesButton.setTitleColor(.white, for: .normal)
        seriesButton.backgroundColor = .systemBlue
        
        seriesButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.bottom.equalToSuperview()
            $0.width.height.equalTo(40)
        }
        
        seriesButton.layer.cornerRadius = 20
        seriesButton.clipsToBounds = true // 둥글 테두리 벗어나간 부분은 잘려나감
    }
}
