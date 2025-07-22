//
//  ChattingViewController.swift
//  UIKitPractice15
//
//  Created by 송재훈 on 7/20/25.
//

import UIKit

class ChattingViewController: UIViewController {
    // TODO: 서치바, 검색
    var chatList: [Chat]?

    @IBOutlet var tableView: UITableView!
    @IBOutlet var textView: UITextView!
    @IBOutlet var textViewBackground: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextView()
        configureTableView()
        
        view.border()
    }
}

// MARK: TextView
extension ChattingViewController {
    func configureTextView() {
        textViewBackground.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor).isActive = true
    }
}

// MARK: TableView
extension ChattingViewController: UITableViewDelegate, UITableViewDataSource {
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "YouChatCell", bundle: nil), forCellReuseIdentifier: "YouChatCell")
        tableView.register(UINib(nibName: "MeChatCell", bundle: nil), forCellReuseIdentifier: "MeChatCell")
        tableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chatList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let chat = chatList?[indexPath.row] else { return UITableViewCell() }
        if chat.user.name == "김새싹" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MeChatCell", for: indexPath)
            (cell as? MeChatCell)?.chatLabel.text = chat.message
            (cell as? MeChatCell)?.timeLabel.text = chat.timeDate
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "YouChatCell", for: indexPath)
            
            (cell as? YouChatCell)?.profileImage.image = UIImage(imageNamed: chat.user.image)
            (cell as? YouChatCell)?.nameLabel.text = chat.user.name
            (cell as? YouChatCell)?.chatLabel.text = chat.message
            (cell as? YouChatCell)?.timeLabel.text = chat.timeDate
            
            return cell
        }
    }
}
