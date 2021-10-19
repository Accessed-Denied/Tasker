//
//  HideKeyboardExtension.swift
//  Tasker
//
//  Created by Rohit Saini on 19/10/21.
//

import SwiftUI

#if canImport(UIKit)
extension View{
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
