//
//  BackgroundImageView.swift
//  Tasker
//
//  Created by Rohit Saini on 19/10/21.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        Image("rocket")
            .antialiased(true)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.all, edges: .all)
    }
}

struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView()
    }
}
