//
//  ContentView.swift
//  Memorize
//
//  Created by Yixiang Yin on 2022/11/22.
//

import SwiftUI
// name: type
// contentview behaves like a view
struct ContentView: View {
    // a view is a rectangle area
    // compulsory variable for a view
    // {}: a function with no arguments
    // some View tells the compiler that we return some kind of view, not necessarily Text
    @State var emojis = [
    "😚", "😙",  "😋", "😛",
    "😜", "🤪",  "😝", "🤑",
    "🤗", "🤭",  "🤫", "🤔",
    "🤐", "🤨",  "😐", "😑",
    "😶", "🎯",  "🌫️", "😀",
    "😄", "😁",  "😈", "😺"]
    @State var theme1 = ["🍅", "🍓", "🥬", "🍇", "🍑", "🥑", "🥝", "🍍"]
    @State var theme2 = ["🦎", "🦉", "🦖", "🦂", "🦅", "🐍", "🦚", "🦇", "🦈"]
    @State var emojiCount = 5
    // 0 -> emojis, 1 -> theme1, 2 -> theme2
    @State var currentTheme = 0
    var body: some View {
        // return this. this is the type of some View
        // this is not text after calling the padding function
        // stack them towards us
        VStack {
            Text("Memorize!").font(.title)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    if currentTheme == 0 {
                        ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                            CardView(content: emoji)
                                .aspectRatio(2/3, contentMode: .fit)
                        }
                    } else if currentTheme == 1 {
                        
                        
                        ForEach(theme1[0..<emojiCount], id: \.self) { emoji in
                            CardView(content: emoji)
                                .aspectRatio(2/3, contentMode: .fit)
                        }
                        
                    } else {
                        
                        ForEach(theme2[0..<emojiCount], id: \.self) { emoji in
                            CardView(content: emoji)
                                .aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                moodButton
                Spacer()
                fruitButton
                Spacer()
                animalButton
            }
            .padding()
            .font(.largeTitle)
        }
        .padding(.horizontal)
            
    }
    
    // use this code replacement
    var moodButton: some View {
        Button {
            currentTheme = 0
            emojis.shuffle()
            
        } label: {
            VStack{
                Image(systemName: "face.smiling")
                Text("Mood").font(.body)
            }
        }
        .padding(.horizontal)
    }
    var fruitButton: some View {
        Button {
            currentTheme = 1
            theme1.shuffle()
            
        } label: {
            VStack{
                Image(systemName: "carrot")
                Text("Fruit").font(.body)
            }
        }
    }
    var animalButton: some View {
        Button {
            currentTheme = 2
            theme2.shuffle()
        } label: {
            VStack{
                Image(systemName: "fish")
                Text("Animial").font(.body)
            }
        }
        .padding(.horizontal)
    }
}

// view is immutable always
struct CardView: View {
    var content: String
    // @State turns variable to pointer
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth:3)
                Text(content).font(.largeTitle)
            }
            else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
































// for preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
