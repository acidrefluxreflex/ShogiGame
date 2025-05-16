//
//  HomeView.swift
//  ShogiGame
//
//  Created on 2025/5/4.
//

import SwiftUI

struct HomeView: View {
    // TODO: ホーム画面（ログイン、対戦開始）
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Shogi Game")
                    .font(.largeTitle)
                    .padding()
                
                NavigationLink(destination: GameView()) {
                    Text("対戦開始")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .navigationTitle("ホーム")
        }
    }
}


#Preview {
    HomeView()
}
