import UIKit
import RealmSwift

class UserInfoViewController: UIViewController {
  private var realm: Realm!
  private var infoList: Results<UserDto>!
  private var token: NotificationToken!
  @IBOutlet weak var tableView: UITableView!

  override func awakeFromNib() {
    super.awakeFromNib()

    realm = try! Realm()
    //print(Realm.Configuration.defaultConfiguration.fileURL)
    infoList = realm.objects(UserDto.self)
    token = infoList.observe { [weak self] _ in
      self?.reload()
    }
  }

  deinit {
    token.invalidate()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  @IBAction func addTapped(_ sender: Any) {
    let dlg = UIAlertController(title: "新規ユーザー情報", message: "", preferredStyle: .alert)
    dlg.addTextField(configurationHandler: nil)
    dlg.addTextField(configurationHandler: nil)
    dlg.addAction(UIAlertAction(title: "登録", style: .default, handler: { action in
      if let t = dlg.textFields![0].text,
        !t.isEmpty {
        self.addUserInfo(title: t)
      }
    }))
    present(dlg, animated: true)
  }

  func addUserInfo(title: String) {
    try! realm.write {
      realm.add(UserDto(value: ["title": title]))
    }
  }

  func deleteUserInfo(at index: Int) {
    try! realm.write {
      realm.delete(infoList[index])
    }
  }

  func reload() {
    if let _ = tableView{
        tableView.reloadData()
    }
  }
}

extension UserInfoViewController: UITableViewDelegate {
}

extension UserInfoViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return infoList.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "oneAccount", for: indexPath)
    cell.textLabel?.text = infoList[indexPath.row].title
    return cell
  }

  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  }

  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    deleteUserInfo(at: indexPath.row)
  }
}
