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
    }
}

//MARK: - ScrollView
extension DetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        detailView.scrollViewDidScroll()
    }
}

