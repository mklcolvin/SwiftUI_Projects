//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Mike Colvin on 1/3/23.
//

import SwiftUI


var gameTiles = ["Rock", "Paper", "Scissors"]
var playerCue = "Throw"



struct ContentView: View {
    
    @State private var showResults = false
    @State private var playerChoice  = ""
    @State private var winLose = ""
    @State private var score = 0
    
    var winDirection = ["Win", "Lose"]
    
    func updateScore() {
        if winLose == "Win" {
            score += 1
        }
        else {
            score -= 1
        }
    }
    
    func gamePlay() {
        
        let newTiles = gameTiles.shuffled()
        let computerPlay = newTiles.randomElement()
        
        if (computerPlay == "Rock" && playerChoice  == "Paper") || (computerPlay == "Paper" && playerChoice == "Scissors") || (computerPlay == "Scissors" && playerChoice == "Rock") {
            winLose = "Win"
            }
        else {
            winLose = "Lose"
        }
        updateScore()
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
                    Text("\(winDirection[0])")
                        .foregroundColor(.green)
                }
            }


            VStack {
                Text("Your Choice:")
                    .padding()
                Image("Rock")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding()
                
            }


            VStack {
                if showResults {
                    Text("Computer Throws:")
                        .padding()
                    HStack {
                        Image("Scissors")
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
                showResults.toggle()
                winLose = "Lose"
            }
        }

        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
