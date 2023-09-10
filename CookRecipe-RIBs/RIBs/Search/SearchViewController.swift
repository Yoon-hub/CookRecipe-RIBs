//
//  SearchViewController.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/10.
//

import RIBs
import RxSwift
import UIKit

protocol SearchPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class SearchViewController: CommonViewController, SearchPresentable, SearchViewControllable {

    weak var listener: SearchPresentableListener?
    
    override func viewDidLoad() {

    }
}
