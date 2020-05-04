

import UIKit



extension ArtistController {
    
    
    



   
func setupData() {

    let tags = artistGetInfo?.artist?.tags.tag ?? [Tag]()
    let stringTags = tags.map { (tag) -> String in

        return String(tag.name)
        }.joined(separator: ", ")
    tagLabel.text = "Tags - \(stringTags)"

    artistInfoLabel.text = artistGetInfo?.artist?.bio.content

    guard let url = URL(string: artistGetInfo?.artist?.image[1].text ?? "") else { return }

    miniImageView.af_setImage(withURL: url)
    imageView.af_setImage(withURL: url)

    artistNameLabel.text = artistGetInfo?.artist?.name

    let attributedText = listenersLabel.setAttributedMutable(string: "Listeners", textColor: nil, textAlignment: .center, atrributes: [NSAttributedString.Key.foregroundColor : UIColor.gray, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)])

    attributedText.appendAttributed(string: "\n\(artistGetInfo?.artist?.stats.listeners.convertWithComma() ?? "")", atrributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])

    listenersLabel.attributedText = attributedText


    let playCountAttributed = playCountLabel.setAttributedMutable(string: "PlayCount", textColor: nil, textAlignment: .center, atrributes: [NSAttributedString.Key.foregroundColor : UIColor.gray, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)])

    playCountAttributed.appendAttributed(string: "\n\(artistGetInfo?.artist?.stats.playcount.convertWithComma() ?? "")", atrributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])

    playCountLabel.attributedText = playCountAttributed


    return

    }
    
      func setupColectionView() {
        
        collectionView.register(ArtistCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.frame = .zero
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .white
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topAlbumsLimited.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ArtistCell
        
        
        let album = topAlbumsLimited[indexPath.item]
        cell.album = album
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = (view.frame.width - 2) / 2
        
        return CGSize(width: size, height: size)
        
    }
    
    func setupViews() {
        
        imageView.contentMode = .scaleToFill
        
        
        tagLabel.textAlignment = .center
        tagLabel.textColor = UIColor.darkBlue
        tagLabel.numberOfLines = 0
        tagLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        
        artistInfoLabel.numberOfLines = 0
        artistInfoLabel.textColor = .black
        
        
        dismissButton.setImage(#imageLiteral(resourceName: "dismis").withRenderingMode(.alwaysTemplate), for: .normal)
        dismissButton.tintColor = .white
        dismissButton.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        
        imageView.addSubview(visualEffect)
        
        
        visualEffect.setAnchors(top: imageView.topAnchor, bottom: imageView.bottomAnchor, left: imageView.leftAnchor, right: imageView.rightAnchor, constantTop: 0, constantBottom: 0, constantLeft: 0, constantRight: 0, height: 0, width: 0)
        
        
        
        view.addSubview(dismissButton)
        dismissButton.setAnchors(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, left: nil, right: view.rightAnchor, constantTop: 20 , constantBottom: 0, constantLeft: 0, constantRight: 20, height: 40, width: 40)
        
        view.addSubview(tagLabel)
        
        
        
        tagLabel.setAnchors(top: nil, bottom: nil, left: view.leftAnchor, right: view.rightAnchor, constantTop: 0, constantBottom: 0, constantLeft: 4, constantRight: 4, height: 100, width: view.frame.width)
        tagLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20).isActive = true
        tagLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        
        
        view.addSubview(separatorLine)
        separatorLine.backgroundColor = .lightGray
        
        separatorLine.setAnchors(top: tagLabel.bottomAnchor, bottom: nil, left: view.leftAnchor, right: view.rightAnchor, constantTop: 0, constantBottom: 0, constantLeft: 0, constantRight: 0, height: 0.5, width: 0)
        
        
        
        view.addSubview(scrollView)
        scrollView.setAnchors(top: separatorLine.bottomAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, constantTop: 4, constantBottom: 0, constantLeft: 4, constantRight: 4, height: 0, width: 0)
        
        
        scrollView.addSubview(collectionView)
        scrollView.addSubview(artistInfoLabel)
        scrollView.delegate = self
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = true
        
        
        let nextButton = UIButton(type: .system)
        nextButton.setImage(#imageLiteral(resourceName: "next").withRenderingMode(.alwaysTemplate), for: .normal)
        nextButton.tintColor = .white
        nextButton.addTarget(self, action: #selector(loadMoreAlbums), for: .touchUpInside)
        
        
        
        collectionView.setAnchors(top: scrollView.topAnchor, bottom: nil, left: view.leftAnchor, right: view.rightAnchor, constantTop: 0, constantBottom: 0, constantLeft: 0, constantRight: 0, height: 260, width: 0)
        
        artistInfoLabel.setAnchors(top: collectionView.bottomAnchor, bottom: scrollView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, constantTop: 4, constantBottom: 0, constantLeft: 8, constantRight: 8, height: 0, width: 0)
        
        
        scrollView.addSubview(nextButton)
        nextButton.setAnchors(top: nil, bottom: collectionView.bottomAnchor, left: nil, right: collectionView.rightAnchor, constantTop: 0, constantBottom: 8, constantLeft: 0, constantRight: 8, height: 44, width: 44)
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
        
        
}
    
    
    

// MVVM

//extension ArtistGetInfo {
//
//func toModelView() -> ModelView {
//
//    let artistGetInfo: ArtistGetInfo! = nil
//
//    let tags = artistGetInfo?.artist?.tags.tag ?? [Tag]()
//    let stringTags = tags.map { (tag) -> String in
//
//        return String(tag.name)
//        }.joined(separator: ", ")
//
//
//    let bioString = artistGetInfo?.artist?.bio.content
//
//
//
//    let url = URL(string: artistGetInfo?.artist?.image[1].text ?? "")
//
//
//    let artistName = artistGetInfo?.artist?.name
//
//    let attributedText = NSMutableAttributedString(string: "Listeners", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)])
//
//    attributedText.appendAttributed(string: "\n\(artistGetInfo?.artist?.stats.listeners.convertWithComma() ?? "")", atrributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
//
//
//
//
//    let playCountAttributed = NSMutableAttributedString(string: "PlayCount", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)])
//
//    playCountAttributed.appendAttributed(string: "\n\(artistGetInfo?.artist?.stats.playcount.convertWithComma() ?? "")", atrributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
//
//
//    return ModelView(tagText: stringTags, bioText: bioString ?? "", artistName: artistName ?? "" , miniImageView: url ?? URL(string: "")!, imageUrl: url ?? URL(string: "")!, listenersAttributed: attributedText, playCountAttributed: playCountAttributed )
//
//
//
//
//
//}
//}


    
    

