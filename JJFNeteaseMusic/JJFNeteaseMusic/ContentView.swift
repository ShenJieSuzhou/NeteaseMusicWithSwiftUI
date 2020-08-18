//
//  ContentView.swift
//  JJFNeteaseMusic
//
//  Created by shenjie on 2020/8/14.
//

import SwiftUI

struct RedView: View {
    var body: some View {
        Color.red
    }
}

struct BlueView: View {
    var body: some View {
        Color.blue
    }
}


struct ContentView: View {
    var body: some View {
        TabView {
            CustomNavigation()
             .tabItem {
                Image(systemName: "flame")
                Text("发现")
              }
            
            Text("视频")
                 .tabItem {
                    Image(systemName: "video")
                    Text("视频")
                  }
            
            Text("我的音乐")
                .tabItem {
                    Image(systemName: "play")
                    Text("我的")
                }
            
            Text("云村")
                .tabItem {
                    Image(systemName: "person.2")
                    Text("云村")
                }
            
            Text("账号")
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("账号")
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
