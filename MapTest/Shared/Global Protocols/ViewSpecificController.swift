//
//  ViewSpecificController.swift
//  MapTest
//
//  Created by shakhzodurinboev on 24/09/21.
//

import Foundation
import UIKit

protocol ViewSpecificController {
    associatedtype RootView: UIView
}

extension ViewSpecificController where Self: UIViewController {
    func view() -> RootView {
        return self.view as! RootView
    }
}
