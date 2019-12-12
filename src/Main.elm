port module Main exposing (homeButton, main, topBar)

import Browser
import Element exposing (Element, alignRight, centerY, el, fill, padding, rgb255, row, spacing, text, width)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Html exposing (Html)
import Json.Decode as Decode exposing (Decoder, Value)
import Pizza exposing (Pizza)


type alias Model =
    List Pizza


type Msg
    = PizzasReceived Value


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        PizzasReceived value ->
            case Decode.decodeValue decodePizzas value of
                Ok pizzas ->
                    ( pizzas, Cmd.none )

                Err _ ->
                    ( model, Cmd.none )


main : Program Value Model Msg
main =
    Browser.element
        { init = \_ -> ( [], Cmd.none )
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


view : Model -> Html msg
view model =
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


decodePizzas : Decoder (List Pizza)
decodePizzas =
    Decode.list Pizza.decode


subscriptions : Model -> Sub Msg
subscriptions _ =
    receivePizzas PizzasReceived


port receivePizzas : (Value -> msg) -> Sub msg
