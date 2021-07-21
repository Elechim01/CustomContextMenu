//
//  Home.swift
//  CustomContextMenu
//
//  Created by Michele Manniello on 21/07/21.
//

import SwiftUI

@available(iOS 15.0, *)
struct Home: View {
    @State var onEndded = false
    var body: some View {
        NavigationView{
            ZStack{
                CustomContextMenu {
//                    contenent..
                    Label {
                        Text("Unlock Me")
                    } icon: {
                        Image(systemName: "lock.fill")
                    }
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.vertical,12)
                    .padding(.horizontal,20)
                    .background(.purple)
                    .cornerRadius(8)

                } preview: {
                    Image("Pic")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                } action: {
                    
//                    your action in menu...
//                    Actions..
                    let like = UIAction(title: "Like Me", image: UIImage(systemName: "suit.heart.fill")){ _ in
                        print("Like")
                    }
                    let share = UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up.fill")){ _ in
                        print("share")
                    }
                   
                    return UIMenu(title : "", children: [like,share])
                }onEnd: {
                    withAnimation{
                        onEndded.toggle()
                    }
                }
//                you View when its expandend...
                if onEndded{
//                    for getting size..
                    GeometryReader{proxy in
                        let size = proxy.size
                        Image("Pic")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width, height:size.height)
                            .cornerRadius(1)
                    }
                    .ignoresSafeArea(.all,edges: .bottom)
//                    remove opacity animation...
                    .transition(.identity)
//                    nav bar button For Closing..
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                withAnimation {
                                    onEndded.toggle()
                                }
                            } label: {
                                Text("Close")
                            }

                        }
                    }
                }

            }
            .navigationTitle(onEndded ? "Unlocked ":"Custom Context Menu")
//            chaing Navbar style..
            .navigationBarTitleDisplayMode(onEndded ? .inline : .large)
        }
    }
}

@available(iOS 15.0, *)
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
