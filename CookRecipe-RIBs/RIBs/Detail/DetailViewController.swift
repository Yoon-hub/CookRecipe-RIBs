//
//  DetailViewController.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/10.
//

import RIBs
import RxSwift
import UIKit
import Kingfisher

protocol DetailPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func setRecipe()
    func didBackButtonTapped()
}

final class DetailViewController: CommonViewController, DetailPresentable, DetailViewControllable {

    weak var listener: DetailPresentableListener?
    
    let detailView = DetailView()
    
    override func loadView() {
        self.view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.scrollView.delegate = self
    }
    
    override func setUI() {
        listener?.setRecipe()
        touchNavigationBackButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        detailView.scrollViewInitContentOffsetY = detailView.scrollView.contentOffset.y
    }
}

//MARK: UI

extension DetailViewController {
    func setRecipe(recipe: [String: String]) {
        detailView.imageView.kf.setImage(with: URL(string: recipe[RowDictionary.image.rawValue]!))
        detailView.titleLabel.text = recipe[RowDictionary.title.rawValue]
        detailView.ingredientLabel.text = recipe[RowDictionary.ingredient.rawValue]
        var manualText = ""
        
        Recipe.allCases.forEach {
            if let manual = recipe[$0.rawValue] {
                let removeEnter = manual.replacingOccurrences(of: "\n", with: " ")
                manualText += "\(removeEnter)\n"
            }
        }
        
        detailView.manualLabel.text = manualText
    }
    
    func touchNavigationBackButton() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(backButtonTapped))
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backButtonTapped() {
        // 여기에 원하는 작업을 추가하십시오.
        // 예를 들어, 뷰 컨트롤러를 팝하거나 이전 화면으로 이동하는 코드를 여기에 추가할 수 있습니다.
        self.navigationController?.popViewController(animated: true)
        self.listener?.didBackButtonTapped()
    }

}

//MARK: - ScrollView
extension DetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        detailView.scrollViewDidScroll()
    }
}

