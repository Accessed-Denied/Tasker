//
//  Constant.swift
//  Tasker
//
//  Created by Rohit Saini on 18/10/21.
//

import Foundation
import SwiftUI

// MARK: - FORMATTER
 let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

// MARK: - UI
var backgroundGradient: LinearGradient{
    return LinearGradient(colors: [Color.pink,Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing)
}

// MARK: - UX

let feedback = UINotificationFeedbackGenerator()


