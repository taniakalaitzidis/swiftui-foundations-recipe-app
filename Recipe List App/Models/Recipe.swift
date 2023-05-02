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
    var highlights:[String]
    var ingredients:[Ingredients]
    var directions:[String]
    
}

class Ingredients: Identifiable, Decodable {
    //remember, identifiable means it lets it works inside a swiftui List, and decodable lets us easily decode the json data.

    var id:UUID?
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?
    
}
