# FontFit

<p align="center">
    <img src="./.github/demo1.gif" width=200 />
    <img src="./.github/demo2.gif" width=200 />
</p>

## Purpose
FontFit adjusts the `font` size of a view (i.e. `UILabel` or `UITextView`) to fill it's container.

FontFit is the missing inverse of `sizeToFit()`. The `FontFit` extensions are a more detailed implementation of UILabel's [adjustsFontSizeToFitWidth](https://developer.apple.com/documentation/uikit/uilabel/1620546-adjustsfontsizetofitwidth) which only _reduces_ font size.

## Examples
**Note**: A full example use case can be found in the _Example_ project.

```Swift
let label = UILabel(frame: ...)

// Increase font to fill the label's frame.
label.fitTextToBounds()
```

```Swift
let label = UILabel(frame: ...)

// Increase font to fill the label's frame, attempting to distribute onto, at most, 2 lines.
label.fitText(maxLines: 2)
```