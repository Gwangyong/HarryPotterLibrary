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
        setupseriesButtonLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 제약조건 설정
    private func setupseriesButtonLayout() {
        addSubview(seriesButton)
    
        seriesButton.setTitle("1", for: .normal) // 우선은 하드코딩
        seriesButton.titleLabel?.font = .systemFont(ofSize: 16)
        seriesButton.setTitleColor(.white, for: .normal)
        seriesButton.backgroundColor = .systemBlue
        
        seriesButton.snp.makeConstraints {
            // BookTopTableView의 top으로부터 16 떨어짐.
            // StackView로 인해 TtileView의 bottom과 16 떨어진 것과 동일
            $0.top.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
            // TODO: 지금은 버튼 크기 자동으로 20 이상 떨어짐. 추후에 버튼 추가하면서 필요하면 수정
        }
        
        // TODO: width 값 주고 / 2 하려니까 안된다.. 나중에 수정하자
        seriesButton.layer.cornerRadius = 15
        seriesButton.clipsToBounds = true // 둥글 테두리 벗어나간 부분은 잘려나감
    }
}
