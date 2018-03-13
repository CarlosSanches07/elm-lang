import Html             exposing ( Html, Attribute, input, text )
import Html.Attribute   exposing ( .. )
import Html.Events      exposing ( onInput )

main =
    Html.beginnerProgram { model = model, view = view, update = update }


 {-Model-}

type alias Model =
    { content : String }

model : Model

model =
    { content : "" }


 {-Update-}

 type Msg
    = Change String

update : Msg -> Model ->  Model

update msg model = 
    case msg of
