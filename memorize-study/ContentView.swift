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
                        element in CardView(content: element.content, isShowingContent: element.isShowing,
                                            shouldHideCard: element.hasMatched,
                            onTap: {
                            memorizeGame.onTapCard(element.id)
                        })
                    })
                }

            }
        }
        
    }
}

struct CardView: View {
    let content: String
    let isShowingContent: Bool
    let shouldHideCard: Bool
    let onTap: () -> Void
    
    var body: some View {
        if (shouldHideCard) {
         CardStyle
                .opacity(0)
        } else {
            CardStyle
        }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
