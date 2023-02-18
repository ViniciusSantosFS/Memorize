import SwiftUI

struct ContentView: View {
    @ObservedObject var memorizeGame = MemorizeModelView()
    
    let columns = [
        GridItem(),
        GridItem(),
        GridItem(),
        ]
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
                .fontWeight(.regular)
            
            Spacer()
            
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(memorizeGame.deckOfCards, id: \.id, content: {
                        element in CardView(content: element.content, isShowingContent: element.isShowing, onTap: {
                            memorizeGame.onTapCard(element.id)
                        })
                    })
                }

            }
            
            Spacer()
            
//            HStack {
//                TabView(tabIcon: "car", tabLabel: "Vehicles", onTap: {
//                    selectedCardsToShow = vehiclesCards
//                    cardsColors = Color.red
//                })
//
//                TabView(tabIcon: "person", tabLabel: "People", onTap: {
//                    selectedCardsToShow = peopleCards
//                    cardsColors = Color.blue
//                })
//
//                TabView(tabIcon: "basket", tabLabel: "Fruits", onTap: {
//                    selectedCardsToShow = fruitsCards
//                    cardsColors = Color.green
//                })
//
//            }
//            .foregroundColor(.blue)
//
        }
        
    }
}

struct CardView: View {
    let content: String
    let isShowingContent: Bool
    let onTap: () -> Void
    
    
    var body: some View {
       CardStyle
    }
    
    var CardStyle: some View {
        ZStack {
            if (isShowingContent) {
                RoundedRectangle(cornerRadius: 20, style: .continuous).stroke(.red, lineWidth: 3).foregroundColor(.white)
                Text(content)
                    .font(.largeTitle)
                
            } else {
                RoundedRectangle(cornerRadius: 20, style: .continuous).foregroundColor(.red)
            }
        }
        .frame(height: 130)
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .onTapGesture { onTap() }
    }
}

struct TabView: View {
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
