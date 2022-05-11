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

    @State private var scale: CGFloat = 1

    private var width: CGFloat {
        UIScreen.main.bounds.width - 10
    }

    private var height: CGFloat {
        300
    }

    var body: some View {
        let shrinkGesture = LongPressGesture(minimumDuration: 0.1)
            .onChanged { _ in
                withAnimation(.spring()) {
                    self.scale = 0.9
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    withAnimation(.spring()) {
                        self.scale = 1
                    }
                }
            }

        VStack {
            Image(systemName: "star")
                .frame(maxWidth: .infinity)

            Text("test")
                .frame(maxWidth: .infinity)
        }
        .frame(width: width, height: height)
        .background(Color.blue)
        .cornerRadius(20)
        .scaleEffect(scale)
        .gesture(shrinkGesture)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
