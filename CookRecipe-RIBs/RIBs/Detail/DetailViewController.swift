//
//  DetailViewController.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/10.
//

import RIBs
import RxSwift
import UIKit

protocol DetailPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class DetailViewController: CommonViewController, DetailPresentable, DetailViewControllable {

    weak var listener: DetailPresentableListener?
    
    let detailView = DetailView()
    
    override func loadView() {
        self.view = detailView
    }
    
}
