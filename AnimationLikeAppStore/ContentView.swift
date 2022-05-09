//
//  ContentView.swift
//  AnimationLikeAppStore
//
//  Created by Mizuo Nagayama on 2022/05/09.
//

import SwiftUI

struct ContentView: View {

    var body: some View {

        ScrollView {
            VStack(spacing: 30) {
                Spacer()

                Text("Today")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()

                CardView()
            }
        }
    }
}

struct CardView: View {

    private var width: CGFloat {
        UIScreen.main.bounds.width - 10
    }

    private var height: CGFloat {
        300
    }

    var body: some View {
        VStack {
            Image(systemName: "star")
                .frame(maxWidth: .infinity)

            Text("test")
                .frame(maxWidth: .infinity)
        }
        .frame(width: width, height: height)
        .background(Color.blue)
        .cornerRadius(20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
