module Main exposing (homeButton, main, topBar)

import Element exposing (Element, alignRight, centerY, el, fill, padding, rgb255, row, spacing, text, width)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font


main =
    Element.layout []
        topBar


topBar : Element msg
topBar =
    row [ width fill, padding 10, spacing 10, Background.color (rgb255 34 139 34) ]
        [ homeButton
        ]


homeButton : Element msg
homeButton =
    el
        [ Background.color (rgb255 240 0 245)
        , Font.color (rgb255 255 255 255)
        , Border.rounded 3
        , padding 5
        ]
        (text "Pastasciutta")
