
struct Start:Decodable {
    let feed:Feed?
}
class Feed:Decodable{
    let title:String
    let id:String
    let author:Author
    let links:[Links]
    let copyright:String
    let country:String
    let icon:String
    let updated:String
    let results:[Results]
    
}
struct Author:Decodable{
    let name:String?
    let url:String?
}
struct Links:Decodable{
    let slf:String?
    let alternate:String?
}

struct Results:Decodable{
    let artistName:String?
    let id:String?
    let releaseDate:String?
    let name:String?
    let kind:String?
    let artistId:String?
    let contentAdvisoryRating:String?
    let artistUrl:String?
    let artworkUrl100:String?
    let genres:[Genres]?
    let url:String?
    
    
}

struct Genres:Decodable{
    let genreId:String?
    let name:String?
    let url:String?
}
