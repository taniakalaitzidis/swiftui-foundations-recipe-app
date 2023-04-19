//
//  DataService.swift
//  Recipe List App
//
//  Created by Tania CATS on 4/11/23.
//

import Foundation

class DataService {
    // source where the data fetching happens. we are parsing the json data here because it makes it neater if you have just this code in one place instead of every single viewmodel you have (if you have multiple viewmodels)
    
    static func getLocalData() -> [Recipe] { // if we use static in front of a method, it makes it so you don't have to call an instance of it, turns it into a "type" method. instead of calling getLocalData on an instance of DataService(), when you turn it into a type method, you can call that method directly on the data type.
        // parse local json file
        
        // get a URL path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // the pathstring could be nil, returns optional string. we will use guard statement. it's checking if pathString is not nil, otherwise... return an empty recipe list
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // create a URL object. pathString is an optional string, and we checked that if its nil or not (and what to do if nil) using the guard statement, so we can safely unwrap using !
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // create a data object. we put "try" in front of it because it potentially throws an error
            let data = try Data(contentsOf: url)
            
            // decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // add the unique ids
                for r in recipeData {
                    r.id = UUID()
                }
                
                // return the recipes
                return recipeData
            }
            
            catch {
                // error with parsing JSON
                print(error)
            }
            
          
        }
        
        catch {
            //error with getting data
            print(error)
        }
        return [Recipe]()
    }

}
