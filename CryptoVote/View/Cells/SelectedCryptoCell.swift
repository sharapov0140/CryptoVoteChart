////
////  SelectedCryptoCell.swift
////  CryptoVote
////
////  Created by ZAF on 4/2/19.
////  Copyright © 2019 Muzaffar Sharapov. All rights reserved.
////
//
//
//import UIKit
//import Firebase
//
//
//
//protocol FeedCellDelegate {
////    func handleUsernameTapped(for cell: FeedCell)
////    func handleOptionsTapped(for cell: FeedCell)
//    func handleLikeTapped(for cell: SelectedCryptoCell, isDoubleTap: Bool)
////    func handleCommentTapped(for cell: FeedCell)
////    func handleConfigureLikeButton(for cell: FeedCell)
////    func handleShowLikes(for cell: FeedCell)
////    func configureCommentIndicatorView(for cell: FeedCell)
//}
//
//class SelectedCryptoCell: UICollectionViewCell, GetChartData {
//   
//    
//    
//    
//    func getChartData(with dataPoints: [String], values: [String]) {
//        
//        
//        self.workoutDuration = dataPoints
//        print(dataPoints)
//        
//        self.beatsPerMinute = values
//        
//     //   setupChartView()
//        
//    }
//
//    
//    
//    var delegate: FeedCellDelegate?
//    var stackView: UIStackView!
//    let mainView = MainView()
//    
//    
//    
//    var crypto: CryptoStats? {
//        didSet {
//            
//            if let name = crypto?.price_usd {
//                priceLabel.text = name
//            }
//            
//        }
//    }
//    
//    
//    
//    
//    
//    let priceLabel: UILabel = {
//        let price = UILabel()
//        // price.text = "TEST"
//        price.translatesAutoresizingMaskIntoConstraints = false
//        price.textColor = .red
//        return price
//    }()
//    
//    
//    
//    
//    
//    
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        //let cubicChart = MainView(frame:CGRect(x:0,y:0,width:self.view.frame.width,height:self.view.frame.height))
//        addSubview(mainView)
//        addSubview(priceLabel)
//        
//        
//        backgroundColor = .white
//        mainView.translatesAutoresizingMaskIntoConstraints = false
//        mainView.delegate = self
//        
//        //   mainView.anchor(top: view.topAnchor, leading: view.leftAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
//        mainView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
//        
//        mainView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
//        //        mainView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
//        //        mainView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
//        //        mainView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
//        
//        
//        
//        
//        priceLabel.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 15).isActive = true
//        priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
//        //  priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 5).isActive = true
//        priceLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        //   priceLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250).isActive = true
//        
//        
//        
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    
//    
//    
//    
//    var pricesArray = [String]()
//    
//    
//    var beatsPerMinute = [String]()
//    var workoutDuration = [String]()
//    
//    func populateChartData() {
//        
//        
//        
//        workoutDuration = ["1","2","3","4","5","6","7","8","9","10","11"]
//        
//        
//        print(workoutDuration)
//        
//   //     self.setupChartView()
//        
//    }
//
//    
//    
//    
//    
//    
//    
//    
////    var post: Post? {
////
////        didSet {
////
////      //      guard let ownerUid = post?.ownerUid else { return }
////     //       guard let imageUrl = post?.imageUrl else { return }
////            guard let likes = post?.likes else { return }
////
//////            Database.fetchUser(with: ownerUid) { (user) in
//////                self.profileImageView.loadImage(with: user.profileImageUrl)
//////                self.usernameButton.setTitle(user.username, for: .normal)
//////                self.configurePostCaption(user: user)
//////            }
//////            postImageView.loadImage(with: imageUrl)
////
////            likesLabel.text = "\(likes) likes"
////            configureLikeButton()
////            configureCommentIndicatorView()
////        }
////    }
//    
////    let profileImageView: CustomImageView = {
////        let iv = CustomImageView()
////        iv.contentMode = .scaleAspectFill
////        iv.clipsToBounds = true
////        iv.backgroundColor = .lightGray
////        return iv
////    }()
////
////    lazy var usernameButton: UIButton = {
////        let button = UIButton(type: .system)
////        button.setTitle("Username", for: .normal)
////        button.setTitleColor(.black, for: .normal)
////        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
////        button.addTarget(self, action: #selector(handleUsernameTapped) , for: .touchUpInside)
////        return button
////    }()
////
////    lazy var optionsButton: UIButton = {
////        let button = UIButton(type: .system)
////        button.setTitle("•••", for: .normal)
////        button.setTitleColor(.black, for: .normal)
////        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
////        button.addTarget(self, action: #selector(handleOptionsTapped) , for: .touchUpInside)
////        return button
////    }()
////
////    lazy var postImageView: CustomImageView = {
////        let iv = CustomImageView()
////        iv.contentMode = .scaleAspectFill
////        iv.clipsToBounds = true
////        iv.backgroundColor = .lightGray
////
////        let likeTap = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTapToLike))
////        likeTap.numberOfTapsRequired = 2
////        iv.isUserInteractionEnabled = true
////        iv.addGestureRecognizer(likeTap)
////
////        return iv
////    }()
////
////    lazy var likeButton: UIButton = {
////        let button = UIButton(type: .system)
////        button.setImage(#imageLiteral(resourceName: "like_unselected"), for: .normal)
////        button.tintColor = .black
////        button.addTarget(self, action: #selector(handleLikeTapped) , for: .touchUpInside)
////        return button
////    }()
////
////    lazy var commentButton: UIButton = {
////        let button = UIButton(type: .system)
////        button.setImage(#imageLiteral(resourceName: "comment"), for: .normal)
////        button.tintColor = .black
////        button.addTarget(self, action: #selector(handleCommentTapped) , for: .touchUpInside)
////        return button
////    }()
//    
//    //    let messageButton: UIButton = {
//    //        let button = UIButton(type: .system)
//    //        button.setImage(#imageLiteral(resourceName: "send2"), for: .normal)
//    //        button.tintColor = .black
//    //        return button
//    //    }()
//    
//    //    let savePostButton: UIButton = {
//    //        let button = UIButton(type: .system)
//    //        button.setImage(#imageLiteral(resourceName: "ribbon"), for: .normal)
//    //        button.tintColor = .black
//    //        return button
//    //    }()
//    
////    lazy var likesLabel: UILabel = {
////        let label = UILabel()
////        label.font = UIFont.boldSystemFont(ofSize: 12)
////        label.text = "3 likes"
////
////        // add gesture recognizer to label
////        let likeTap = UITapGestureRecognizer(target: self, action: #selector(handleShowLikes))
////        likeTap.numberOfTapsRequired = 1
////        label.isUserInteractionEnabled = true
////        label.addGestureRecognizer(likeTap)
////
////        return label
////    }()
////
////    let captionLabel: ActiveLabel = {
////        let label = ActiveLabel()
////        label.numberOfLines = 0
////        return label
////    }()
////
////    let postTimeLabel: UILabel = {
////        let label = UILabel()
////        label.textColor = .lightGray
////        label.font = UIFont.boldSystemFont(ofSize: 10)
////        label.text = "2 DAYS AGO"
////        return label
////    }()
////
////    let commentIndicatorView: UIView = {
////        let view = UIView()
////        view.backgroundColor = .red
////        return view
////    }()
////
////
////    let separatorView: UIView = {
////        let view = UIView()
////        view.backgroundColor = .lightGray
////        return view
////    }()
////
////    override init(frame: CGRect) {
////        super.init(frame: frame)
////
////        addSubview(profileImageView)
////        profileImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 40, height: 40)
////        profileImageView.layer.cornerRadius = 40 / 2
////
////        addSubview(usernameButton)
////        usernameButton.anchor(top: nil, left: profileImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
////        usernameButton.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
////
////        addSubview(optionsButton)
////        optionsButton.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
////        optionsButton.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
////
////        addSubview(postImageView)
////        postImageView.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
////        postImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
////
////        configureActionButtons()
////
////        addSubview(likesLabel)
////        likesLabel.anchor(top: likeButton.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: -4, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
////
////        addSubview(captionLabel)
////        captionLabel.anchor(top: likesLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
////
////        addSubview(postTimeLabel)
////        postTimeLabel.anchor(top: captionLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
////
////    }
////
////    // MARK: - Handlers
////
////    @objc func handleUsernameTapped() {
////        delegate?.handleUsernameTapped(for: self)
////    }
////
////    @objc func handleOptionsTapped() {
////        delegate?.handleOptionsTapped(for: self)
////    }
////
////    @objc func handleLikeTapped() {
////        delegate?.handleLikeTapped(for: self, isDoubleTap: false)
////    }
////
////    @objc func handleCommentTapped() {
////        delegate?.handleCommentTapped(for: self)
////    }
////
////    @objc func handleShowLikes() {
////        delegate?.handleShowLikes(for: self)
////    }
////
////    @objc func handleDoubleTapToLike() {
////        delegate?.handleLikeTapped(for: self, isDoubleTap: true)
////    }
////
////    func configureLikeButton() {
////        delegate?.handleConfigureLikeButton(for: self)
////    }
////
////    func configureCommentIndicatorView() {
////        delegate?.configureCommentIndicatorView(for: self)
////    }
////
////    func configurePostCaption(user: User) {
////        guard let post = self.post else { return }
////        guard let caption = post.caption else { return }
////        guard let username = post.user?.username else { return }
////
////        // look for username as pattern
////        let customType = ActiveType.custom(pattern: "^\(username)\\b")
////
////        // enable username as custom type
////        captionLabel.enabledTypes = [.mention, .hashtag, .url, customType]
////
////        // configure usnerame link attributes
////        captionLabel.configureLinkAttribute = { (type, attributes, isSelected) in
////            var atts = attributes
////
////            switch type {
////            case .custom:
////                atts[NSAttributedString.Key.font] = UIFont.boldSystemFont(ofSize: 12)
////            default: ()
////            }
////            return atts
////        }
////
////        captionLabel.customize { (label) in
////            label.text = "\(username) \(caption)"
////            label.customColor[customType] = .black
////            label.font = UIFont.systemFont(ofSize: 12)
////            label.textColor = .black
////            captionLabel.numberOfLines = 2
////        }
////
////        postTimeLabel.text = post.creationDate.timeAgoToDisplay()
////    }
////
////    func configureActionButtons() {
////        stackView = UIStackView(arrangedSubviews: [likeButton, commentButton])
////
////        stackView.axis = .horizontal
////        stackView.distribution = .fillEqually
////
////        addSubview(stackView)
////        stackView.anchor(top: postImageView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 120, height: 50)
////
////
////    }
////
////    func addCommentIndicatorView(toStackView stackView: UIStackView) {
////
////        commentIndicatorView.isHidden = false
////
////        stackView.addSubview(commentIndicatorView)
////        commentIndicatorView.anchor(top: stackView.topAnchor, left: stackView.leftAnchor, bottom: nil, right: nil, paddingTop: 14, paddingLeft: 64, paddingBottom: 0, paddingRight: 0, width: 10, height: 10)
////        commentIndicatorView.layer.cornerRadius = 10 / 2
////    }
////
////    required init?(coder aDecoder: NSCoder) {
////        fatalError("init(coder:) has not been implemented")
////    }
//}
