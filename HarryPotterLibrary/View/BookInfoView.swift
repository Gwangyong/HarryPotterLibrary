//
//  BookInfoView.swift
//  HarryPotterLibrary
//
//  Created by 서광용 on 6/17/25.
// MARK: - 책 표지, 저자, 출간일, 페이지 수 View

import UIKit
import SnapKit

final class BookInfoView: UIView {
    private let bookInfoHorizontalStackView = UIStackView()
    private let bookCoverImageView = UIImageView()
    private let bookInfoVerticalStackView = UIStackView()
    
    private let infoTitleLabel = UILabel()
    
    private let authorTitleLabel = UILabel() // Author
    private let authorContentLabel = UILabel() // 저자(J.K Rowling)
    
    private let releaseDateTitleLabel = UILabel() // Released
    private let releaseDateContentLabel = UILabel() // 출간일(June 26, 1997)
    
    private let pageCountTitleLabel = UILabel() // Pages
    private let pageCountContentLabel = UILabel() // 페이지 수(223)
    
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
        addSubview(bookInfoHorizontalStackView)
        
        // 가로 스택뷰에 이미지와 텍스트 영역(verticalStackView) 추가
        [bookCoverImageView, bookInfoVerticalStackView].forEach {
            bookInfoHorizontalStackView.addArrangedSubview($0)
        }
    }
    
    // MARK: - 제약조건 설정
    private func setupLayout() {
         setupHorizentalStackViewLayout()
         setupImageViewLayout()
         setupVerticalStackViewLayout()
         setupInfoTitleLabelLayout()
         setupAuthorLabelLayout()
         setupReleaseDateLabelLayout()
         setupPageCountLabelLayout()
    }
    
    /// 전달받은 Book 인스턴스를 기반으로 책 정보의 라벨과 이미지를 설정하는 메서드
    /// - Parameters:
    ///   - book: 책 정보가 포함된 Book 인스턴스
    ///   - index: 시리즈 번호(0부터 시작)로, 이미지 에셋 이름 매칭에 사용 (예: harrypotter1 ~ harrypotter7)
    func configure(with book: Book, index: Int) {
        infoTitleLabel.text = book.title
        authorContentLabel.text = book.author
        releaseDateContentLabel.text = formatDate(book.releaseDate)
        pageCountContentLabel.text = "\(book.pages)"
        
        // 시리즈 번호로 이름 매칭해서 이미지 가져오기
        let imageName = BookSeriesImage.imageName(index: index)
        bookCoverImageView.image = UIImage(named: imageName)
    }
    
    // 가로 스택뷰(horizentalStackView) 제약조건 설정
    private func setupHorizentalStackViewLayout() {
        bookInfoHorizontalStackView.axis = .horizontal
        bookInfoHorizontalStackView.spacing = 16
        bookInfoHorizontalStackView.alignment = .top
        
        bookInfoHorizontalStackView.snp.makeConstraints {
            $0.directionalEdges.equalToSuperview()
        }
    }
    
    // 이미지 뷰(ImageView) 제약조건 설정
    private func setupImageViewLayout() {
        bookCoverImageView.contentMode = .scaleAspectFill // 비율 유지하며 프레임을 꽉채움
        bookCoverImageView.clipsToBounds = true // 넘어가는 부분은 자름
        
        bookCoverImageView.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(bookCoverImageView.snp.width).multipliedBy(1.5) // height = width x 1.5
        }
    }
    
    // 세로 스택뷰(VerticalStackView) 제약조건 설정
    private func setupVerticalStackViewLayout() {
        bookInfoVerticalStackView.axis = .vertical
        bookInfoVerticalStackView.spacing = 6
    }
    
    // 제목 라벨(InfoTitleLabel) 제약조건 설정
    private func setupInfoTitleLabelLayout() {
        infoTitleLabel.font = .boldSystemFont(ofSize: 20)
        infoTitleLabel.textColor = .black
        infoTitleLabel.numberOfLines = 0
        
        // verticalStackView에 추가
        bookInfoVerticalStackView.addArrangedSubview(infoTitleLabel)
    }
    
    // 저자 라벨(AuthorLabel) Row StackView 생성
    private func makeAuthorRowStackView() -> UIStackView {
        // Author 타이틀과 저자 이름을 담은 가로 스택뷰 생성
        let authorRowStack = UIStackView(arrangedSubviews: [authorTitleLabel, authorContentLabel])
        authorRowStack.axis = .horizontal
        authorRowStack.spacing = 8
        return authorRowStack
    }
    
    // 저자 라벨(AuthorLabel) 제약조건 설정
    private func setupAuthorLabelLayout() {
        authorTitleLabel.font = .boldSystemFont(ofSize: 16)
        authorTitleLabel.textColor = .black
        authorTitleLabel.text = InfoViewSectionLabel.author // MARK: "Author"
        
        authorContentLabel.font = .systemFont(ofSize: 18)
        authorContentLabel.textColor = .darkGray
        authorContentLabel.numberOfLines = 0
        
        // 우선순위 설정
        setPriority(label: authorTitleLabel, hugging: .required, compression: .required)
        setPriority(label: authorContentLabel, hugging: .defaultLow, compression: .defaultLow)
        
        let authorRow = makeAuthorRowStackView()
        bookInfoVerticalStackView.addArrangedSubview(authorRow)
    }
    
    // 출간일 라벨(ReleaseDateLabel) Row StackView 생성
    private func makeReleaseDateRowStackView() -> UIStackView {
        let releaseDateRowStack = UIStackView(arrangedSubviews: [releaseDateTitleLabel, releaseDateContentLabel])
        releaseDateRowStack.axis = .horizontal
        releaseDateRowStack.spacing = 8
        return releaseDateRowStack
    }
    
    // 출간일 라벨(ReleaseDateLabel) 제약조건 설정
    private func setupReleaseDateLabelLayout() {
        releaseDateTitleLabel.font = .boldSystemFont(ofSize: 14)
        releaseDateTitleLabel.textColor = .black
        releaseDateTitleLabel.text = InfoViewSectionLabel.released // MARK:  Released
        
        releaseDateContentLabel.font = .systemFont(ofSize: 14)
        releaseDateContentLabel.textColor = .gray
        releaseDateContentLabel.numberOfLines = 0
        
        setPriority(label: releaseDateTitleLabel, hugging: .required, compression: .required)
        setPriority(label: releaseDateContentLabel, hugging: .defaultLow, compression: .defaultLow)

        releaseDateContentLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        releaseDateContentLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        let releaseDateRow = makeReleaseDateRowStackView()
        bookInfoVerticalStackView.addArrangedSubview(releaseDateRow)
    }
    
    // 페이지 수 라벨(PageCountLabel) Row StackView 생성
    private func makePageCountRowStackView() -> UIStackView {
        let pageCountRowStackView = UIStackView(arrangedSubviews: [pageCountTitleLabel, pageCountContentLabel])
        pageCountRowStackView.axis = .horizontal
        pageCountRowStackView.spacing = 8
        return pageCountRowStackView
    }
    
    // 페이지 수 라벨(PageCountLabel) 제약조건 설정
    private func setupPageCountLabelLayout() {
        pageCountTitleLabel.font = .boldSystemFont(ofSize: 14)
        pageCountTitleLabel.textColor = .black
        pageCountTitleLabel.text = InfoViewSectionLabel.pages // MARK:  "Pages"
        
        pageCountContentLabel.font = .systemFont(ofSize: 14)
        pageCountContentLabel.textColor = .gray
        pageCountContentLabel.numberOfLines = 0
        
        setPriority(label: pageCountTitleLabel, hugging: .required, compression: .required)
        setPriority(label: pageCountContentLabel, hugging: .defaultLow, compression: .defaultLow)
        
        let pageCountRow = makePageCountRowStackView()
        bookInfoVerticalStackView.addArrangedSubview(pageCountRow)
    }
    
    
    private func setPriority(label: UILabel, hugging: UILayoutPriority, compression: UILayoutPriority) {
        label.setContentHuggingPriority(hugging, for: .horizontal)
        label.setContentCompressionResistancePriority(compression, for: .horizontal)
    }
    
    /// 주어진 날짜 문자열("yyyy-MM-dd" 형식)을 "MMMM d, yyyy" 형식으로 변환합니다.
    /// - Parameter dateString: 변환할 원본 날짜 문자열 (예: "1997-06-26")
    /// - Returns: "June 26, 1997" 형식으로 변환된 문자열. 파싱 실패 시 원본 문자열 그대로 반환됩니다.
    private func formatDate(_ dateString: String) -> String {
        // 입력된 문자열 형식 설정 ("yyyy-MM-dd" 형식)
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = InfoViewDateFormat.input // MARK: "yyyy-MM-dd"

        // 출력할 문자열 형식 설정 ("MMMM d, yyyy" → 예: June 26, 1997)
        // MMMM: 월 전체 이름(June), d: 일, yyyy: 연도
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = InfoViewDateFormat.output // MARK: "MMMM d, yyyy"
        outputFormatter.locale = Locale(identifier: "en_US")  // locals를 en_US로 지정해줘야 월이 영어 이름이 나옴

        // 입력 문자열을 변환 시도
        if let date = inputFormatter.date(from: dateString) {
            // 성공시 지정된 포맷으로 문자열 반환
            return outputFormatter.string(from: date)
        } else {
            // 파싱 실패 시 원본 그대로 반환
            return dateString
        }
    }
    
    // MARK: 별 의미는 없지만 하드코딩을 아예 안써보고 싶어서 해보는 중..
    // 섹션별 라벨
    private enum InfoViewSectionLabel {
        static let author = "Author"
        static let released = "Released"
        static let pages = "Pages"
    }
    
    // 날짜 포맷
    private enum InfoViewDateFormat {
        static let input = "yyyy-MM-dd"
        static let output = "MMMM d, yyyy"
    }
    
    // 시리즈 이미지
    private enum BookSeriesImage {
        static func imageName(index: Int) -> String {
            return "harrypotter\(index + 1)"
        }
    }
}
