//
//  SignUpView.swift
//  jsonProject
//
//  Created by Abdoulaye Aliou SALL on 15/02/2023.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var userService:UserServices 
    @Binding var isPresented:Bool
    @State var Prenom: String = ""
    @State var nom: String = ""
    @State var email: String = ""
    @State var motDePasse: String = ""
    var body: some View {
        NavigationView(){
            ZStack{
                Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
                VStack(alignment: .center){
                    Text("Create New User")
                    Spacer()
                        .font(Font.system(size: 16, weight: .bold))
                    
                    
                    TextField("Prenom", text: $Prenom)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(6)
                        .padding(.bottom)
                    
                    TextField("Nom", text: $nom)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(6)
                        .padding(.bottom)
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(6)
                        .padding(.bottom)
                    TextField("Mot de passe", text: $motDePasse)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(6)
                        .padding(.bottom)
                    Button{
                        print("je suis la ")
                        let user = User(id: 1, prenom: Prenom, nom: nom, role: "user", motDePasse: motDePasse,email: email)
                        print(user)
                    userService.sendPostData(user: user)
                                    print("deja envoyé")
                                } label: {
                                    Text("Validate")
                                }.padding(.leading).buttonStyle(.borderedProminent)
                    
                    Spacer()
                }
                
            }
            .navigationBarItems(leading: leading )
            .environmentObject(userService)
        }
    }
    
    var leading : some View{
        Button(action: {
            isPresented.toggle()
        },
               label: {
            Text("cancel")
        })
    }
}

//struct SignUpView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUpView(isPresented: .constant(false))
//    }
//}
