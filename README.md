# alphacamp-final-assessment

1. 計算 1 ~ 100 中奇數的總和
    - 產生一個 1 到 100 的 for 迴圈
    - 將其中為奇數的數字 (被 2 除餘數為 1 的數字) 加總
    - Reference: [Control Flow](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/ControlFlow.html)

2. 畫面符合以下要求

    ![Alt text](/images/assessment%232.png?raw=true "Assessment#2")
    
    - 拉兩個 UIView 分別設定背景為橘色與綠色
    - 設定橘色 UIView 距離左邊螢幕 15， 距離右邊綠色 UIView 10， 底部螢幕 10
    - 設定綠色 UIView 距離左邊橘色 UIView 10， 距離右邊螢幕 15， 底部螢幕 10
    - 設定兩個 UIView 等寬且高度為 superView 的九分之一
    
    Note: 邊界與寬高為約略估計值。

3. View Controller 的 life cycle
    - 建立 singleton 物件來觀察並紀錄 life cycle
    - 繼承要觀察的函式方法，例如：viewDidLoad，viewWillAppear，viewDidAppear，viewWillLayoutSubviews，viewDidLayoutSubviews，viewWillDisappear，viewDidDisappear
    - 將紀錄存到 singleton 物件並寫入檔案 
    - Reference: [Life Cycle](https://developer.apple.com/library/ios/referencelibrary/GettingStarted/DevelopiOSAppsSwift/Lesson4.html)
