//
//  ChattingViewController.swift
//  UIKitPractice15
//
//  Created by 송재훈 on 7/20/25.
//

import UIKit

class ChattingViewController: UIViewController {
    var chatList: [Chat]?

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
}

extension ChattingViewController: UITableViewDelegate, UITableViewDataSource {
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "YouChatCell", bundle: nil), forCellReuseIdentifier: "YouChatCell")
//        tableView.rowHeight = 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chatList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YouChatCell", for: indexPath)
        guard let chat = chatList?[indexPath.row] else { return UITableViewCell() }
        
        (cell as? YouChatCell)?.profileImage.image = UIImage(named: "TravelTalk/\(chat.user.image)")
        (cell as? YouChatCell)?.nameLabel.text = chat.user.name
        (cell as? YouChatCell)?.chatLabel.text = chat.message
        (cell as? YouChatCell)?.timeLabel.text = chat.date
        
        return cell
    }
}
