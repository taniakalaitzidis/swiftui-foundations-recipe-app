//
//  Recipe.swift
//  Recipe List App
//
//  Created by Tania CATS on 4/11/23.
//

import Foundation

 // we're using a class instead of struct because we will be using IDs to be shown in a list
// we need to conform to decodable protocol for the json data

class Recipe: Identifiable, Decodable {
    
    //UUID is set to optional because we are going to set it after the fact, after we decode it
    var id:UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var ingredients:[String]
    var directions:[String]
    
}
