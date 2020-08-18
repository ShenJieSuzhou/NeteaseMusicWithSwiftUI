//
//  JJCustomNavigationController.swift
//  JJFNeteaseMusic
//
//  Created by shenjie on 2020/8/17.
//

import SwiftUI

struct NewTestView: View {
    var body: some View {
        List(0..<100) { item in
            Text("\(item)")
        }
        .navigationBarTitle("NavigationNew")
    }
}

struct CustomNavigation: View {
    let array = ["Peter", "Paul", "Mary", "Anna-Lena", "George", "John", "Greg", "Thomas", "Robert", "Bernie", "Mike", "Benno", "Hugo", "Miles", "Michael", "Mikel", "Tim", "Tom", "Lottie", "Lorrie", "Barbara"]
        @State private var searchText = ""
        @State private var showCancelButton: Bool = false
    
    
    var body: some View {

           NavigationView {
               VStack {
                   // Search view
                   HStack {
                       HStack {
                           Image(systemName: "magnifyingglass")

                           TextField("search", text: $searchText, onEditingChanged: { isEditing in
                               self.showCancelButton = true
                           }, onCommit: {
                               print("onCommit")
                           }).foregroundColor(.primary)

                           Button(action: {
                               self.searchText = ""
                           }) {
                               Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                           }
                       }
                       .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                       .foregroundColor(.secondary)
                       .background(Color(.secondarySystemBackground))
                       .cornerRadius(10.0)

                       if showCancelButton  {
                           Button("Cancel") {
                                   UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                                   self.searchText = ""
                                   self.showCancelButton = false
                           }
                           .foregroundColor(Color(.systemBlue))
                       }
                   }
                   .padding(.horizontal)
                   .navigationBarHidden(showCancelButton) // .animation(.default) // animation does not work properly

                   List {
                       // Filtered list of names
                       ForEach(array.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self) {
                           searchText in Text(searchText)
                       }
                   }
                   .resignKeyboardOnDragGesture()
               }
           }
       }
    
//    @State private var searchText = ""
//    var body: some View {
//        NavigationView {
//            VStack{
//                HStack {
//                   Image(systemName: "magnifyingglass")
//
//                    TextField("search", text: $searchText, onEditingChanged: {_ in
//                   }, onCommit: {
//                       print("onCommit")
//                   }).foregroundColor(.primary)
//
//                   Button(action: {
//
//                   }) {
//                       Image(systemName: "xmark.circle.fill").opacity(0)
//                   }
//               }
//               .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
//               .foregroundColor(.secondary)
//               .background(Color(.secondarySystemBackground))
//               .cornerRadius(10.0)
//            }
//            .navigationBarItems(
//                leading: Button(action: {
//                    print("录音")
//                }, label: {
//                    Text("返回")
//                }),
//                trailing: Button(action: {
//                    print("正在播放")
//                }, label: {
//                    Text("当前")
//                })
//            )
//        }
//    }
}

struct JJCustomNavigationController_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigation()
       
    }
}

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}
