//
//  ContentView.swift
//  ShogiGame
//
//  Created by Kabuki Iwashita on 2025/05/04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("ホーム")
                }
            
            GameView()
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("対戦")
                }
            
            SettingView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("設定")
                }
        }
        .accentColor(.blue)
    }
}

#Preview {
    ContentView()
}
