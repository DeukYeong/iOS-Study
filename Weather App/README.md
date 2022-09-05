# __날씨앱 만들기 프로젝트!__

<img width="30%" src="https://user-images.githubusercontent.com/112817940/188341960-67375e40-469c-43a1-b757-83bf551ea4b8.gif"/>

<span style="font-size: 180%">__Extract SubView를__ 활용했습니다!<br></span> 
<br>
개발자 서근님이 제작하신 예제를 코린이눈높이에서 제 해석한 글 입니다!

## 먼저 BackGround를 만들어줄꺼에요!

__LinearGradient__ 란 키워드를 사용합니다
```swift
struct backgroundView: View {
  
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [is9Night ? .black : .blue, isNight ? .gray : .white]), startPoint: .topTrailing, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}
```
코드를 설명하기 전에 먼저 **Button**을 화용해서 **다크모드**, **라이트모드**를 구현할거에요!

코드해석을 시작할게요

```swift 
@Binding var isNight: Bool
```
 **is Night란** 변수가 ContentView에 **@State** 타입으로 있습니다.
 <br>
 **@State**타입으로 된 **isNight** 에게 False, True를 받아옵니다.
 <br>
 코드를 더 살펴볼게요
 ## 중요
 ```swift
 isNight ? .black : .blue
 ```
만약 **isNight**가 **false**라면 색상을 검은색으로 설정하고 **true**라면 파란색으로 지정한다. 추후설명은 생략 하겠습니다.

