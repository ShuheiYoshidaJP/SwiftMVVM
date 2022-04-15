//
//  ModelProtocol.swift
//  SwiftMVVM
//
//  Created by 吉田周平 on 2022/04/15.
//

import Foundation
import RxSwift

protocol ModelProtocol {
    func validate(passwordText: String?) -> Observable<Void>
}

