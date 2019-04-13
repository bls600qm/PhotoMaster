## これだけは抑えておくポイント
- カメラとアルバムから写真を取得するときは，以下のように, UIImagePickerControllerDelegate と UINavigationControllerDelegateを継承する．
```
class ViewController: UIViewController,ここに書く {  
```


- iPhoneの中のユーザのデータにアクセスするときは，使用目的を書く必要があるらしい．  
カメラとフォトライブラリの場合はInfo.plistAddのAdd Rowから，   
Privacy - Camera Usage Description  
Privacy - Photo Library Usage Description  
Privacy - Photo Library Additions Usage Descriptionの3つを追加する．


  
