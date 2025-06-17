//
//  BookInfoView.swift
//  HarryPotterLibrary
//
//  Created by 서광용 on 6/17/25.
// MARK: 책 표지, 저자, 출간일, 페이지 수 View

import SnapKit
import UIKit

final class BookInfoView: UIView {
    private let horizentalStackView = UIStackView()
    private let imageView = UIImageView()
    private let verticalStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBookInfoUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func setupBookInfoUI() {

    }
}
