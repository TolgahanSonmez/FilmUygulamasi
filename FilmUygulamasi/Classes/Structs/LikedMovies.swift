//
//  LikedMovies.swift
//  FilmUygulamasi
//
//  Created by Opendart Yazılım ve Bilişim Hizmetleri on 17.06.2022.
//

import Foundation
//singleton design pattern
struct LikedMovies : Codable {
  //eğer struct nesne oluşturma aşamasına hiç nesne oluşturmadıysa
    // bir kerelik nesne oluşturuluyor
    //nesney ihtiyaç duyulduğunda tekrar sıfırdan bir nesne oluşturulmuyor
    // var olan nesne üzerinden işlemler gerçekleştiriyor
    //observer design pattern
    static var shared = LikedMovies()
    
    var likedMovies : [PopMovieResult] = []
    
    //detayına gittiğimiz filmin likedMovies array içinde olup olmadığını bize true yada false şeklinde dönecek
    
    func isLiked(movie : PopMovieResult) -> Bool {
        //contains like yapmak istediğimiz film likedMovies array içinde var ise true yoksa false değereni geri döner
        if likedMovies.contains(where: {$0.id == movie.id}){
            return true
        } else
        {
            return false
        }
    }
    
   //detayına gittiğim her filmi like yapmamı sağlar.
    mutating func like(movie : PopMovieResult){
        //eğer isLiked fonksiyonunda eklemek istediğim film ilgili array da var ise
        // return diyerek hiç array eklemeden fonksiyondan çıkar
        if isLiked(movie: movie)
        {
            return
        }
        likedMovies.append(movie)
        print(likedMovies)
        saveLikedMovies()
    }
    //kendisine gelen filmi likedMovies array inden kaldıracak
    mutating func unLike(movie: PopMovieResult)
    {
        if !isLiked(movie: movie) {
            return
        }
        likedMovies = likedMovies.filter{$0.id  != movie.id}
        print(likedMovies)
        saveLikedMovies()
        
    }
    
    //kendisine string olarak gelen begenilmis film array ini UserDefault ile uygulama içinde kaydeder
    func saveLikedMovies() {
        // UserDefault içinde String e çevrilmiş array i saklamamızı sağlayacak
        let begenilenFilmler = arrayToString(array: likedMovies)
        print(begenilenFilmler)
        UserDefaults.standard.set( begenilenFilmler, forKey:"SavedMovies")
        
        
    }
    //UserDefaults kaydedilmiş beğenilmiş filmleri tekrar array e çevirir
    mutating func loadLikedMovies(){
        if let kaydedilmisFilmlerString = UserDefaults.standard.object(forKey: "SavedMovies") as? String {
            let begenilmisFilmDizisi = self.stringToArray(string: kaydedilmisFilmlerString)
            print(begenilmisFilmDizisi)
            self.likedMovies = begenilmisFilmDizisi
            print(likedMovies)
        }
    }
    
    //kendisine gelen array bir string olarak geri dönecek
    func arrayToString(array : [PopMovieResult]) -> String
    {
        let encoder = JSONEncoder()
        //encode ile gelen veriyi şifreleyip bir string e dönüştürdük.
        if let jsonData : Data = try? encoder.encode(array) {
          
            let dataString = String(data:jsonData, encoding:String.Encoding.utf8)
            print(jsonData)
            return dataString!
        }
        return ""
    }
    
    //kendisine gelen bir string veriyi içinde PopMovieResult tipinde veri bulunduray bir array e dönüştürür
    func stringToArray(string : String) -> [PopMovieResult] {
        let decoder = JSONDecoder()
        if let begenilenFilmlerArray = string.data(using: .utf8)
        {
            print(begenilenFilmlerArray)
            let jData = try? decoder.decode([PopMovieResult].self, from :begenilenFilmlerArray)
            return jData ?? []
        }
        return []
    }
    
}
