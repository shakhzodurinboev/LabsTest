//
//  NSObject.swift
//  MapTest
//
//  Created by shakhzodurinboev on 24/09/21.
//

import Foundation
public extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}

