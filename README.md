# PapagoTranslator
This is a translation REST API applied to Naver Papago. It is a REST API that outputs input text as translated text in other languages ​​(English, Chinese).

A framework to use <a href="https://developers.naver.com/docs/nmt/reference/">Papago API by Naver</a> in Swift.


## Installation
<b>CocoaPods:</b>
<pre>
pod 'PapagoTranslator'
</pre>
<b>Manual:</b>
<pre>
Copy <i>PapagoTranslator.swift</i> to your project.
</pre>

## Initialization

First of all you have to generate id & secret to use Naver services in the <a href="https://developers.naver.com/">console</a>.
And then use the following code:
```swift
PapagoTranslator.init(id: "", secret: "")
```

## Using

```swift
let pt = PapagoTranslator.init(id: "", secret: "")
pt.run("hello", "en", "ko") { (text, err) in
    guard let text = text, err == nil else {
        print(err?.localizedDescription)
        return
    }

    print(text)
}
```

## License

<i>PapagoTranslator</i> is available under the MIT license. See the LICENSE file for more info.
