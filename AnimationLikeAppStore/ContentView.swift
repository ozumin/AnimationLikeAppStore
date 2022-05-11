//
//  ContentView.swift
//  AnimationLikeAppStore
//
//  Created by Mizuo Nagayama on 2022/05/09.
//

import SwiftUI

struct ContentView: View {

    @State private var showDetailView = false

    private var axes: Axis.Set {
        showDetailView ? [] : .vertical
    }

    var body: some View {

        ScrollView(axes) {
            VStack(spacing: 30) {

                if showDetailView == false {
                    Spacer()

                    Text("Today")
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                }

                CardView(showDetailView: $showDetailView)
            }
        }
        .ignoresSafeArea()
    }
}

struct CardView: View {

    @State private var scale: CGFloat = 1

    @Binding var showDetailView: Bool

    private var width: CGFloat {
        showDetailView ? UIScreen.main.bounds.width : UIScreen.main.bounds.width - 10
    }

    private var height: CGFloat {
        showDetailView ? UIScreen.main.bounds.height : 300
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

        let tapGesture = TapGesture()
            .onEnded() {
                withAnimation(.spring()) {
                    self.showDetailView = true
                }
            }

        VStack {
            if showDetailView {
                Spacer()
                    .frame(height: 200)
            }

            Image(systemName: "star")
                .frame(maxWidth: .infinity)

            Text("test")
                .frame(maxWidth: .infinity)

            if showDetailView {
                ScrollView {
                    VStack {
                        ForEach(1..<100) { _ in
                            Text("Can you scroll?")
                                .frame(maxWidth: .infinity)
                        }
                    }
                }
            }
        }
        .frame(width: width, height: height)
        .background(Color.blue)
        .cornerRadius(showDetailView ? 0 : 20)
        .scaleEffect(scale)
        .gesture(tapGesture)
        .gesture(shrinkGesture)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
