//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Mike Colvin on 1/3/23.
//

import SwiftUI







struct ContentView: View {
    var gameTiles = [("Rock", Image("Rock")), ("Paper", Image("Paper")), ("Scissors", Image("Scissors"))]
    
    @State private var playerCue = "Throw"
    @State private var showResults = false
    @State private var playerChoice  = ""
    @State private var winLose = ""
    @State private var score = 0
    @State private var index = 0
    @State private var computerPlay = ""
    @State private var decisionSet = "Win"
    
    var winDirection = ["Win", "Lose"]


    func initialize() -> String {
  //      let pickDirection = winDirection.shuffled()
        
        return winDirection.randomElement() ?? "Win"
    }
            
    func updateScore() {
        if winLose == "Win" {
            score += 1
        }
        else {
            score -= 1
        }
    }
    
    func gamePlay() {
        decisionSet = initialize()
        
        let newTiles = gameTiles.shuffled()
        computerPlay = newTiles.randomElement()?.0 ?? ""
        if (computerPlay == "Rock" && playerChoice  == "Paper") || (computerPlay == "Paper" && playerChoice == "Scissors") || (computerPlay == "Scissors" && playerChoice == "Rock") {
            winLose = "Win"
            }
        else {
            winLose = "Lose"
        }
        
        if (decisionSet == "Win" && winLose == "Win") || (decisionSet == "Lose" && winLose == "Lose")  {
            winLose = "Win"
        }
        else {
            winLose = "Lose"
        }
            
        updateScore()

        playerCue = "Throw Again?"
    }
                                                                                                                            
    var body: some View {
        VStack {
            VStack {
                VStack {
                    Text("Rock! Paper! Scissors!")
                        .padding()
                        .fontWeight(.bold)
                    HStack {
                        Text("Score:")
                        Text("\(score)")
                    }
                    
                }
            }
            .padding()
            VStack {
                HStack {
                    Text("To win, you must:")
                    Text("\(decisionSet)")
                        .foregroundColor(.green)
                }
            }


            VStack {
                Text("Your Choice:")
                    .padding()
                Button (action: {
                    if index == gameTiles.count - 1 {
                        index = 0
                    } else {
                        index += 1
                    }
                    playerChoice = gameTiles[index].0

                }, label: {
                    HStack {
                        gameTiles[index].1
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                })
            }


            VStack {
                if showResults {
                    Text("Computer Throws:")
                        .padding()
                    HStack {
                        Image(computerPlay)
                            .resizable()
                            .frame(width: 100, height: 100)
                        Image("\(winLose)")
                            .resizable()
                            .frame(width:75, height: 75)
                    }
                    .padding()
                    .padding()
                }
            }
            Button("\(playerCue)") {
                if playerCue == "Throw" {
                    gamePlay()
                    decisionSet = ""
                }
                else {
                    playerCue = "Throw"
                }
                showResults.toggle()

            }
        }

        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
