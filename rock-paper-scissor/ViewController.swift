import UIKit

class ViewController: UIViewController {
    
    let arrChoice: [String] = ["Batu", "Gunting", "Kertas"]
    
    @IBOutlet weak var computerChoice: UILabel!
    @IBOutlet weak var HasilText: UILabel!
    @IBOutlet weak var UserText: UILabel!
    
    var userChoice: String?
    var randomIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HasilText.text = "Click your choice"
        UserText.text = "Waiting for your choice"
        computerChoice.text = "Computer: ❓"
    }
    
    func determineResult() -> String {
        guard let userChoice = userChoice else { return "Pilih sesuatu!" }
        
        let computerPick = arrChoice[randomIndex]
        
        if userChoice == computerPick {
            return "Seri!"
        } else if (userChoice == "Batu" && computerPick == "Gunting") ||
                  (userChoice == "Gunting" && computerPick == "Kertas") ||
                  (userChoice == "Kertas" && computerPick == "Batu") {
            return "Kamu Menang! 🎉"
        } else {
            return "Kamu Kalah! 😢"
        }
    }
    
    func playGame(choice: String) {
        userChoice = choice
        randomIndex = Int.random(in: 0...2)
        let computerPick = arrChoice[randomIndex]
        
        UserText.text = "Kamu: \(choice)"
        computerChoice.text = "Komputer: \(computerPick)"
        HasilText.text = determineResult()
    }
    
    @IBAction func KertasButton(_ sender: UIButton) {
        playGame(choice: "Kertas")
    }
    
    @IBAction func GuntingButton(_ sender: UIButton) {
        playGame(choice: "Gunting")
    }
    
    @IBAction func BatuButton(_ sender: UIButton) {
        playGame(choice: "Batu")
    }
}
