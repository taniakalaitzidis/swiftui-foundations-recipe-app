//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Tania CATS on 4/11/23.
//

import Foundation

class RecipeModel: ObservableObject {
    // @Published means we are publishing changes
    
    // empty recipe objects
    @Published var recipes = [Recipe]()
    
    init() {
        
        // create an instance of data service and get data
        self.recipes = DataService.getLocalData() //this is going to return a list of recipes
        
        // set the recipes property. all this in turn will publish the changes to the view
        
    }
    
}
