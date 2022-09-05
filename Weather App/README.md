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
<br>

# **BackGroundColor** 만들었으면 이제 **UI**를 그려보죠
지금그려볼 **UI**는 __날짜,날씨아이콘,온도__ 이렇게 그려볼거에요.
<br>
```swift
struct WeatherInfo: View {
    
    var dayOfWeek: String
    var ImageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(.white)
                .padding()
            
            Image(systemName: ImageName)
                .resizable()
                .renderingMode(.original)
                .frame(width: 50, height: 50)
                .aspectRatio(contentMode: .fit)
            
            Text("\(temperature)")
                .font(.system(size: 20))
                .foregroundColor(.white)
        }
    }
}
```
--------
<br>

## 도시이름도 **Extract SubView**로 구현 할게요.
```swift
struct CityName: View {
    
    var title: String
    
    var body: some View {
        
        Text(title)
            .font(.system(size: 30))
            .foregroundColor(.white)
            .fontWeight(.heavy)
    }
}
```

------
<br>

## 날씨별 **Icon**도 구현할게요.


```swift
struct MainWeatherIconView: View {
    
    var ImageName: String
    var temperature: Int
    
    var body: some View {
        
        Image(systemName:ImageName)
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 180, height: 180)
                    .aspectRatio(contentMode: .fit)
                
                Text("\(temperature)°")
                    .font(.system(size: 70))
                    .foregroundColor(.white)
    }
}

```

-----

<br>

## **Button** 구현해볼게요.

```swift
struct WeatherButton: View {
    var title: String
    var backGroundColor: Color
    var textColor: Color
    
    var body: some View {
        Text(title)
            .font(.system(size: 20))
            .bold()
            .frame(width: 300, height: 70)
            .background(backGroundColor)
            .foregroundColor(textColor)
            .cornerRadius(20)
    }
}
```

# 이제 마지막으로 **ContentView** 구현해볼게요.

## **BackGroundColor** 위에다 그려야 되니까 **ZStack**으로 처음에 감싸줄게요.

```swift
//ContentView

var body: some View {

    @State private var isNight = false

    ZStack{
        BackgroundView(isNight: $isNight)
            VStack(spacing: 20) {

                //more code

            }
    }
}
```
+ 아까 말했던 **isNight**라는 변수가 선언됐죠?
+ 기본값이 **false**입니다.

## 다음으로 넘어갈게요.
위에 있는 **VStack** 안에 코드를 넣을게요.
```swift
CityName(title:"인천")
  MainWeatherIconView(ImageName: isNight ? "moon.stars.fill" : "sun.max.fill", temperature: isNight ? 5 : 23)

```
**MainWeatherIconView**에서 **Image** 선언할때 **systemIamge**로 지정했잖아요. 그건 **SF Symbols**에서 찾을수있는 이름들입니다.

------------
**MainWeatherIconView** 밑에다 **Spacer()** 를 추가해줄게요.

```swift
//more code
CityName(title:"인천")
  MainWeatherIconView(ImageName: isNight ? "moon.stars.fill" : "sun.max.fill", temperature: isNight ? 5 : 23)

  Spacer()

```

**Spacer()** 밑에 **HStack** 을 추가해줄게요.

```swift
//more code
Spacer()

   HStack {
    WeatherInfo(dayOfWeek:"월" , ImageName: "sun.max.fill", temperature: 15)
    WeatherInfo(dayOfWeek:"화" , ImageName: "sun.max.fill", temperature: 15)
    WeatherInfo(dayOfWeek:"수" , ImageName: "sun.max.fill", temperature: 15)
    WeatherInfo(dayOfWeek:"목" , ImageName: "sun.max.fill", temperature: 15)
    WeatherInfo(dayOfWeek:"금" , ImageName: "sun.max.fill", temperature: 15)
    }
```
## 위 코드처럼 작성후 **Button**을 추가해줄게요.
+ *HStack바로 밑에 추가해주시면 될꺼같아요*

<br>

```swift
 Button {
    self.isNight.toggle()
} label: {
    WeatherButton(title: isNight ? "라이트모드로 전환" : "다크모드로 전환", backGroundColor: isNight ? .gray : .white, textColor: isNight ? .white : .blue)

}
```
**Label**에있는 코드는 설명 안해도 아시겠죠? 
+ *위에서 설명함*

```swift.
self.isNight.toggle()
```
이것은 무엇이냐
**if**문이랑 비슷하게 생각해주세요.
쉽게 코드를 해석하면 
**isNight**가 **false**면 Text에 **라이트모드로 전환, gray, white**로 변경한다.
이런 소리입니다
```swift
struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        
        ZStack{
            BackgroundView(isNight: $isNight)
            VStack(spacing: 20){
                //more code
                Spacer()
                HStack {
                    //more code
                }
                Button {
                    self.isNight.toggle()
                } label: {
                    WeatherButton(title: isNight ? "라이트모드로 전환" : "다크모드로 전환", backGroundColor: isNight ? .gray : .white, textColor: isNight ? .white : .blue)
                }
                Spacer()
            }
            .padding()
        }
    }
}
```

# __여기 까지 입니다. 감사합니다!__
