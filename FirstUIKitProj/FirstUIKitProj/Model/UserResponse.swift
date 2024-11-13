//
//  UserResponse.swift
//  FirstUIKitProj
//
//  Created by Bhushan Abhyankar on 12/11/2024.
//

struct UserResponse:Decodable{
    let id:Int
    let name:String
    let username:String
    let email:String
    let phone:String
    let website:String
    let address:Address
    let company:Company
}
struct Address:Decodable{
    let street,suite,city,zipcode:String
    let geo:Geo
}
struct Geo:Decodable{
    let lat,lng:String
}
struct Company:Decodable{
    let name:String
    let catchPhrase:String
    let bs:String
}



/*
 {
     "id": 1,
     "name": "Leanne Graham",
     "username": "Bret",
     "email": "Sincere@april.biz",
     "address": {
       "street": "Kulas Light",
       "suite": "Apt. 556",
       "city": "Gwenborough",
       "zipcode": "92998-3874",
       "geo": {
         "lat": "-37.3159",
         "lng": "81.1496"
       }
     },
     "phone": "1-770-736-8031 x56442",
     "website": "hildegard.org",
     "company": {
       "name": "Romaguera-Crona",
       "catchPhrase": "Multi-layered client-server neural-net",
       "bs": "harness real-time e-markets"
     }
   }
 */
