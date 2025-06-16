//
//  BookListViewController.swift
//  HarryPotterLibrary
//
//  Created by 서광용 on 6/16/25.
// MARK: 책 시리즈 탭(1~7) view

import UIKit
import SnapKit

/// 시리즈 버튼 관련 클래스
final class BookTopTabView: UIView {

    private let serizeButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(serizeButton)
        serizeButton.setTitle("1", for: .normal) // 우선은 하드코딩
        serizeButton.titleLabel?.font = .systemFont(ofSize: 16)
        serizeButton.setTitleColor(.white, for: .normal)
        serizeButton.backgroundColor = .systemBlue
        serizeButton.layer.cornerRadius = 15
        serizeButton.clipsToBounds = true // 둥글 테두리 벗어나간 부분은 잘려나감
        
        serizeButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview()
        }
    }
}
