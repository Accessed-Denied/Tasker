//
//  NavigationHeader.swift
//  Tasker
//
//  Created by Rohit Saini on 20/10/21.
//

import SwiftUI

struct NavigationHeader: View {
    
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    var body: some View {
        HStack(spacing: 10){
            //TITLE
            Text("Tasker")
                .font(.system(.largeTitle,design: .rounded))
                .fontWeight(.heavy)
                .padding(.leading,4)
            Spacer()
            //EDIT BUTTON
            EditButton()
                .font(.system(size: 16, weight: .semibold, design: .rounded))
                .padding(.horizontal,10)
                .frame(minWidth: 70,minHeight: 24)
                .background(
                    Capsule().stroke(Color.white,lineWidth: 2)
                )

            
            //APPEARANCE
            Button {
                isDarkMode.toggle()
                playSound(sound: "sound-tap", type: "mp3")
                feedback.notificationOccurred(.success)
            } label: {
                Image(systemName: isDarkMode ? "moon.circle.fill" : "moon.circle")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .font(.system(.title,design: .rounded))
            }

        }
        .foregroundColor(.white)
        .padding()
    }
}

struct NavigationHeader_Previews: PreviewProvider {
    static var previews: some View {
        NavigationHeader()
    }
}
