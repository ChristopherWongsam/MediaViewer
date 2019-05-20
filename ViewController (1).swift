//
//  ViewController.swift
//  MediaViewer
//
//  Created by Check_Out on 5/15/19.
//  Copyright © 2019 Check_Out. All rights reserved.
//

import UIKit
class MusicInfo{
    var song_name = ""
    var imageUrl = ""
    private let media_type = "Music"
    func showMedia()->String{
        return self.media_type
    }
    
    func image()->UIImage?{
        var url = URL(string:self.imageUrl)
        let data = try? Data(contentsOf:url!)
        
        if let imageData = data{
            let image = UIImage(data: data!)
            return image
        }else{return nil}
    }
}



class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView = UITableView()
    var MusicArr = [MusicInfo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getMusicjson()

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setTableView() {
        DispatchQueue.main.async {self.tableView.frame = self.view.frame
            self.tableView.backgroundColor = UIColor.clear
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.separatorColor = UIColor.clear
            self.tableView.backgroundColor = UIColor.blue
            self.view.addSubview(self.tableView)
            self.tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")}
        
        
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.setTableView()
        tableView.frame = self.view.bounds
        var sm = CustomTableViewCell()
        
        
    }
    func getMusicjson(){
        let jsonUrlString = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json"
        
        guard let url = URL(string:jsonUrlString) else {return}
        print(jsonUrlString)
        
        URLSession.shared.dataTask(with: url){ ( data, response, err) in
            
            guard let data = data else {return}
            
            do{
                
               let jsonObj =  try JSONDecoder().decode(Start.self, from: data)
               
                
                for result in (jsonObj.feed?.results)!{
                    var music = MusicInfo()
                    music.song_name = result.artistName!
                    music.imageUrl = result.artworkUrl100!
                    self.MusicArr.append(music)
                    print(result.artistName!)

                }
                self.setTableView()
                DispatchQueue.main.async {self.tableView.reloadData()}

                
            }catch let jsonErr {
                print("error serializing data",jsonErr)
            }
            
            print(jsonUrlString)
            
            
            
            }.resume()
        print("I'm done")
    }


}
extension ViewController{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MusicArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomTableViewCell else{fatalError("Unable to create cell")}
        cell.artName.text = MusicArr[indexPath.row].song_name + "\n" + MusicArr[indexPath.row].showMedia()
        
        cell.artImage.image = MusicArr[indexPath.row].image()
        return cell
    
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 118
    }
}

