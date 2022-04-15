//
//  UserModel.swift
//  SwiftMVVM
//
//  Created by 吉田周平 on 2022/04/15.
//

import Foundation
import RxSwift

class UserModel: ModelProtocol {
    func validate(passwordText: String?) -> Observable<Void> {
        switch passwordText {
        case .none:
            return Observable.error(InValidTextErrorModel.null)
        case let passwordText?:
            // .noneでnullのアンラップができているはず
            let numbersRange = passwordText.rangeOfCharacter(from: .decimalDigits)
            let lettersRange = passwordText.rangeOfCharacter(from: .letters)
            let hasNumber = numbersRange != nil
            let hasLetter = lettersRange != nil
            switch (hasNumber, hasLetter) {
            case (true, false):
                return Observable.error(InValidTextErrorModel.notContainCharacter)
            case (false, true):
                return Observable.error(InValidTextErrorModel.notContainNumber)
            case (true, true):
                return Observable.just(())
            case (false, false):
                return Observable.error(InValidTextErrorModel.other)
            }
        }
    }
}
