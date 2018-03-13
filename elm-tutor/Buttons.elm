import Html         exposing (Html, div, button, text)
import Html.Events  exposing (onClick)


main = 
    Html.beginnerProgram { model = model, view = view, update = update }



 {-Model-}


type alias Model = Int

model : Model

model = 
   0


{-Update-}


type Msg = Decrement | Increment | Reset

update : Msg -> Model -> Model

update msg model = 
    case msg of
        Increment -> 
            model + 1

        Decrement -> 
            model - 1

        Reset -> 
            model - model


 {-View-}

view : Model -> Html Msg
view model = 
    div []
        [ button [ onClick Decrement] [ text "-" ]
        , div [] [text ( toString model )]
        , button [ onClick Increment ] [ text "+"]
        , button [ onClick Reset ] [ text "Reset"]
        ]