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

4. Table View
    - 建立 UITableView 並實作 UITableViewDataSource, UITableViewDelegate
    - ```func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int```
      回傳 table 行數
    - ```func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell```
      將 table cell 的資料填入並回傳
    - ```func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)```
      將點選的資料放入 UIAlertController 並顯示

5. Table View & Camera
    - 增加 UIBarButtonItem 到 UINavigationItem 處並設定系統預設值為 Add
    - 點擊 Add 按鈕時顯示另外一個 UIViewController 做照相的功能
    - 使用 delegate 方式將相片和文字回傳至原 TableView
    - Reference: [Capture Images](https://developer.apple.com/library/ios/samplecode/AVCam/AVCam-iOSUsingAVFoundationtoCaptureImagesandMovies.zip)
