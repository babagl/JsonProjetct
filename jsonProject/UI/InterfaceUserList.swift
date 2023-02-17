//
//  InterfaceUserList.swift
//  jsonProject
//
//  Created by Abdoulaye Aliou SALL on 15/02/2023.
//

import SwiftUI


struct InterfaceUserList: View {
    @StateObject var userService = UserServices()
    @State var isPresentedNewPost = false
   
    var body: some View {
        
        NavigationView() {
                List(userService.userList){ user in
                    VStack {
                        HStack {
                            Text(user.nom)
                            Text(user.prenom)
                        }
                        Text(user.role)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                    }
                }
                .navigationTitle("List Of User ")
                .navigationBarItems(trailing: plusButton)
                .onAppear{
                    print("je suis ici")
                    userService.loadUserList()
                }
            
            
            
        }.sheet(isPresented: $isPresentedNewPost, content: {
            SignUpView(isPresented: $isPresentedNewPost)
                
        })
        .environmentObject(userService)
    }
    
    var plusButton: some View{
        Button(action: {
            print("holla")
            isPresentedNewPost.toggle()
        }, label: {
            Image(systemName: "plus")
        })
    }
}

struct InterfaceUserList_Previews: PreviewProvider {
    static var previews: some View {
        InterfaceUserList()
    }
}
