//
//  ContentView.swift
//  FlagsApp
//
//  Created by Vlad Klunduk on 20/04/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "US"]
    @State var correctCountry = Int.random(in: 0...2)
    
    @State private var title = ""
    @State private var showScore = false
    @State private var score = 0
    @State private var attempt = 0

    var body: some View {
        ZStack{
            LinearGradient(colors: [.white, .blue], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 30){
                Spacer(minLength: 100)
                VStack(){
                    Text("Select flag of")
                        .foregroundStyle(.black)
                        
                    Text(countries[correctCountry])
                        .font(.largeTitle.weight(.semibold))
                        .foregroundStyle(.black)
                }
                ForEach(0..<3){ number in
                    Button{
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .clipShape(.capsule)
                            .shadow(radius: 7)
                    }
                }
                Text("Score: \(score)")
                    .font(.title2)
                    .foregroundStyle(.black)
                Spacer(minLength: 200)
            }
        }
        .alert(title, isPresented: $showScore) {
            Button("Ok") {
                newGame()
            }
        } message: {
            Text("Your score is \(score)")
        }
        
    }
    
    func flagTapped(_ number: Int){
        if number == correctCountry{
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
        }
        attempt += 1
        showScore = true
    }
    
    func newGame(){
        countries.shuffle()
        correctCountry = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
