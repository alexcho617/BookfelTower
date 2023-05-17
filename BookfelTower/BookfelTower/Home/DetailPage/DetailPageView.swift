//
//  DetailPageView.swift
//  BookfelTower
//
//  Created by 김하람 on 2023/05/10.
//

import SwiftUI

struct DetailPageView: View {
    enum CurrentInfo{
        case bookInfo
        case memo
    }
    @State private var currentInfo: CurrentInfo = .bookInfo
    let title: String
    let author: String
    let pageNumber: String
    let coverUrl: String
    let description: String
    let isbn: String
    let publisher: String
    
    var body: some View {
        TopAppBar()
        ScrollView{
            LazyVStack{
                BookDetailVStack
                ReadingDate
                ButtonToggle
                if currentInfo == .bookInfo {
                    HStack{
                        VStack(alignment: .leading, spacing: 3){
                            LabelInfo(title: "책 소개", subTitle: description)
                            LabelInfo(title: "출판사", subTitle: publisher)
                            LabelInfo(title: "ISBN", subTitle: isbn)
                            LabelInfo(title: "페이지", subTitle: pageNumber)
                            HStack{
                                Text("책 정보 수정")
                                    .underline()
                                Text("|")
                                Text("자세히 보기")
                                    .underline()
                            }.foregroundColor(.pink)
                                .font(.system(size: 10))
                                .padding(.top, 10)
                        }.font(.system(size: 13))
                            .padding(.leading,20)
                        Spacer()
                    }
                } else if currentInfo == .memo {
                    HStack{
                        Text("나의 메모")
                        Spacer()
                        Button("작성하기"){
                            print("pressed")
                        }
                        .foregroundColor(.pink)
                    }
                    .padding(.horizontal, 20)
                }
                Spacer()
            }
        }
    }
    
    @ViewBuilder
    private var BookDetailVStack: some View{
        VStack{
            Text(title).padding(.top, 10)
            AsyncImage(url: URL(string: coverUrl)) { image in image
                    .resizable()
                    .frame(width: 150, height: 200)
            } placeholder: {
                ProgressView()
            }
            Text("\(author) (\(pageNumber)p)")
            HStack{
                ForEach(0..<3, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
            ZStack{
                Color(.systemPink)
                Text("읽은 책")
                    .font(.system(size: 13))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }.frame(width: 53, height: 25)
                .padding(.top)
                .padding(.bottom, 30)
        }
    }
    
    @ViewBuilder
    private var ReadingDate: some View{
        VStack{
            HStack{
                Text("독서 기간")
                Spacer()
                Text("001 일 동안 읽었어요")
            }.padding(.horizontal, 20)
            ZStack{
                Color.gray.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                HStack{
                    Text("시작")
                        .foregroundColor(.pink)
                    Text("0000.00.00")
                    Spacer()
                    Text("종료")
                        .foregroundColor(.pink)
                    Text("0000.00.00")
                }
                .padding(.horizontal, 20)
            }
            .frame(width: 350, height: 40)
        }
    }
    
    @ViewBuilder
    private var ButtonToggle: some View{
        HStack {
            Button("책 정보") {
                currentInfo = .bookInfo
            }
            .padding()
            .background(currentInfo == .bookInfo ? Color.blue : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(10)
            Spacer()
            Button("메모") {
                currentInfo = .memo
            }
            .padding()
            .background(currentInfo == .memo ? Color.green : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        Spacer()
    }
    
    @ViewBuilder
    private func LabelInfo(title: String, subTitle: String)-> some View{
        VStack(alignment: .leading){
            Text(title)
                .fontWeight(.bold)
                .padding(.bottom, 5)
            Text(subTitle)
                .foregroundColor(.gray)
                .padding(.bottom,10)
        }
    }
}
struct TopAppBar: View{
    var body: some View{
        ZStack{
            HStack{
                Button(action: {print("Button1")}){
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.gray)
                }
                Spacer()
                Button("수정"){
                    print("수정 pressed")
                }
                Button("삭제"){
                    print("삭제 pressed")
                }
                .foregroundColor(.pink)
            }
            .padding(.horizontal, 20)
            .frame(height: 35)
        }
    }
}

struct DetailPageView_Previews: PreviewProvider {
    static var previews: some View {
        @State var selectedBooks = generateLibraryMockBooks()
        DetailPageView(title: selectedBooks[0].title,
                       author: selectedBooks[0].author,
                       pageNumber: selectedBooks[0].pageNumber,
                       coverUrl: selectedBooks[0].coverUrl,
                       description: selectedBooks[0].description,
                       isbn: selectedBooks[0].isbn,
                       publisher: selectedBooks[0].publisher)
    }
}