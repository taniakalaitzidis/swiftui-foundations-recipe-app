//
//  ContentView.swift
//  Recipe List App
//
//  Created by Tania CATS on 4/11/23.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    //Reference the view model. we have to wrap the var model in @observedobject in order for the data to flow from RecipeModel to the view. It means we are listening to this object for any published changes.
    //@ObservedObject var model = RecipeModel()
    
    var body: some View {
        NavigationView {
            
            VStack (alignment: .leading) {
                Text("All Recipes")
                    .bold()
                    .padding(.top, 40)
                    .font(.largeTitle)
                ScrollView {
                    LazyVStack (alignment: .leading) {
                        ForEach(model.recipes) { r in
                            NavigationLink(destination: RecipeDetailView(recipe:r), label: {
                                HStack(spacing: 20.00) {
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .clipped() //clips images that are outside the frame
                                        .cornerRadius(5)
                                    Text(r.name)
                                        .foregroundColor(.black)
                                }
                            })
                            
                        }
                    }
                    
                }
                
            }
            .navigationBarHidden(true)
            .padding(.leading)
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            RecipeListView()
                .environmentObject(RecipeModel())
        }
    }
}
