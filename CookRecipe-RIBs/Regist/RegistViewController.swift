//
//  RegistViewController.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/09.
//

import RIBs
import RxSwift
import UIKit

protocol RegistPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class RegistViewController: UIViewController, RegistPresentable, RegistViewControllable {

    weak var listener: RegistPresentableListener?
}
