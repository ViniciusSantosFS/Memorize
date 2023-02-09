import SwiftUI

struct ContentView: View {
    let vehiclesCards = ["✈️", "🚇", "🚉", "🚄", "⛴️", "🛶", "🛩️", "🛳️", "🚆","🛬", "🛺"]
    
    let peopleCards = ["🏋🏾", "🪂", "🧘🏼‍♂️","🧍🏽‍♂️", "👫","👩🏼‍🦼","👩🏼‍🚀", "🧑🏾‍🔧", "👨🏿‍🔧", "🎅🏼"]
    
    let fruitsCards = ["🍎", "🍏", "🍐", "🍊", "🍋", "🍌", "🍅", "🥔", "🥕", "🥥", "🍆", "🥑", "🍉", "🍇", "🍒", "🍈", "🥒","🌽"]
    
    @State var selectedCardsToShow: [String]
    @State var cardsColors: Color
    
    let columns = [
        GridItem(),
        GridItem(),
        GridItem(),
        ]
    
    init() {
        selectedCardsToShow = vehiclesCards
        cardsColors = Color.red
    }
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
                .fontWeight(.regular)
            
            Spacer()
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(selectedCardsToShow.shuffled(), id: \.self)
                    { element in
                        Card(icon: element, cardColor: cardsColors)
                    }
                }

            }
            
            Spacer()
            
            HStack {
                Tab(tabIcon: "car", tabLabel: "Vehicles", onTap: {
                    selectedCardsToShow = vehiclesCards
                    cardsColors = Color.red
                })
                
                Tab(tabIcon: "person", tabLabel: "People", onTap: {
                    selectedCardsToShow = peopleCards
                    cardsColors = Color.blue
                })
                
                Tab(tabIcon: "basket", tabLabel: "Fruits", onTap: {
                    selectedCardsToShow = fruitsCards
                    cardsColors = Color.green
                })
                
            }
            .foregroundColor(.blue)
            
        }
        
    }
}

struct Card: View {
    let icon: String
    let cardColor: Color
    @State var isShowingIcon = false
    
    
    var body: some View {
       CardStyle
    }
    
    var CardStyle: some View {
        ZStack {
            if (isShowingIcon) {
                RoundedRectangle(cornerRadius: 20, style: .continuous).stroke(cardColor, lineWidth: 3).foregroundColor(.white)
                Text(icon)
                    .font(.largeTitle)
                
            } else {
                RoundedRectangle(cornerRadius: 20, style: .continuous).foregroundColor(cardColor)
            }
        }
        .frame(height: 130)
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .onTapGesture {
            isShowingIcon = !isShowingIcon
        }
    }
}

struct Tab: View {
    var tabIcon: String
    var tabLabel: String
    var onTap: () -> Void
    
    var body: some View {
        VStack {
            Button(action: onTap) {
                Image(systemName: tabIcon)
                    .font(.system(size: 30))
            }
            Text(tabLabel)
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
