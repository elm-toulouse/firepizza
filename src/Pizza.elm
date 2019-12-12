module Pizza exposing (..)

import Json.Decode as Decode exposing (Decoder)


type alias Pizza =
    { ingredients : List String
    , price : List Int
    , name : String
    }


fromEuros : Float -> Int
fromEuros euros =
    round (euros * 100)


decode : Decoder Pizza
decode =
    Decode.map3 Pizza
        (Decode.field "ingredients" (Decode.list Decode.string))
        (Decode.field "price" (Decode.list (Decode.map fromEuros Decode.float)))
        (Decode.field "name" Decode.string)
