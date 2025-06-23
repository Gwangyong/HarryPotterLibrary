//
//  BookListViewController.swift
//  HarryPotterLibrary
//
//  Created by 서광용 on 6/16/25.
// MARK: - 책 시리즈 탭(1~7) view

import UIKit
import SnapKit

final class BookTopTabView: UIView {
    
    private let buttonContainerView = UIView()
    private var seriesButtons: [UIButton] = []
    
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
        addSubview(buttonContainerView)
    }
    
    // MARK: - 제약조건 설정
    private func setupLayout() {
        setupButtonContainerViewLayout()
        setupSeriesButtonLayout()
        setupSeriesButtonAction()
    }
    
    // 시리즈 버튼 컨테이너 제약조건
    private func setupButtonContainerViewLayout() {
        buttonContainerView.snp.makeConstraints {
            $0.centerX.equalToSuperview() // 가운데로 정렬
            $0.top.bottom.equalToSuperview()
            // 내부 버튼 크기만큼 leading, trailing 크기 결정
        }
    }
    
    // 시리즈 버튼 제약조건
    private func setupSeriesButtonLayout() {
        var previousButton: UIButton? // 이전 버튼 기억
        
        for index in 0..<7 {
            let button = createSeriesButton(index: index)
            buttonContainerView.addSubview(button)
            seriesButtons.append(button) // 배열에 넣음
            
            button.snp.makeConstraints {
                $0.width.height.equalTo(40) // 좌우 고정 값
                $0.top.bottom.equalToSuperview()
                
                if let previous = previousButton {
                    // 이전 버튼이 있으면 offset(12)
                    $0.leading.equalTo(previous.snp.trailing).offset(12)
                } else {
                    // 첫 번째 버튼은 왼쪽에 정렬
                    $0.leading.equalToSuperview()
                }
            }
            
            previousButton = button // 반복되는 제약 조건을 위해서 현재 버튼을 이전 버튼으로 저장
        }
        
        // 반복이 다 끝나면 마지막 버튼이 들어감.
        // 마지막 버튼에 trailing 제약을 추가해줘서 버튼 그룹에 우측 정렬
        previousButton?.snp.makeConstraints {
            $0.trailing.equalToSuperview()
        }
    }
    
    // 버튼 생성
    private func createSeriesButton(index: Int) -> UIButton {
        let button = UIButton()
        button.tag = index
        button.setTitle("\(index + 1)", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }

    // 권수 이동 액션
    private func setupSeriesButtonAction() {
        seriesButtons.forEach {
            $0.addTarget(nil, action: #selector(BookDetailViewController.seriesButtonTapped), for: .touchUpInside)
        }
    }
}
