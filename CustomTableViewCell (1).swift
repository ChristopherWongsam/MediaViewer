//
//  CustomTableViewCell.swift
//  MediaViewer
//
//  Created by Check_Out on 5/15/19.
//  Copyright © 2019 Check_Out. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell{
    
    var message:String?
    var mainImage:UIImage?
    
    
    lazy var backView :UIView = {
        let view = UIView(frame: CGRect(x: 10, y: 6, width: self.frame.width - 20, height: 110))
        view.translatesAutoresizingMaskIntoConstraints = true
        view.backgroundColor = UIColor.white
        return view
    }()
    lazy var artImage:UIImageView = {
        let artImage = UIImageView(frame:CGRect(x: 4, y: 6, width: 108, height: 108))
        artImage.translatesAutoresizingMaskIntoConstraints = true
        return artImage
    }()
    
    lazy var artName:UITextView = {
        let lbl = UITextView()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.isScrollEnabled = false
        
        return lbl
    }()
   
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let message = message {
            artName.text = message
        }
        if let image = mainImage{
            artImage.image = image
        }
        
        
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(artName)
        self.addSubview(artImage)
        
        artImage.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        artImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        artImage.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        artImage.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        artName.leftAnchor.constraint(equalTo: self.artImage.rightAnchor).isActive = true
        artName.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        artName.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        artName.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    

    

}
