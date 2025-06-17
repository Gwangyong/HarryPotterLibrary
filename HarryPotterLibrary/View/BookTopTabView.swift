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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(seriesButton)
        
        seriesButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(seriesButton.snp.width)
        }
        
        seriesButton.setTitle("1", for: .normal) // 우선은 하드코딩
        seriesButton.titleLabel?.font = .systemFont(ofSize: 16)
        seriesButton.setTitleColor(.white, for: .normal)
        seriesButton.backgroundColor = .systemBlue
        seriesButton.layoutIfNeeded() // 레이아웃을 강제로 업데이트
        seriesButton.layer.cornerRadius = seriesButton.bounds.width / 2
        seriesButton.clipsToBounds = true // 둥글 테두리 벗어나간 부분은 잘려나감
    }
}
