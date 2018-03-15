import Html exposing ( .. )
import Html.Attributes exposing ( .. )
import Html.Events exposing ( onInput )
import Regex exposing ( .. )


main =
    beginnerProgram { model = model, view = view, update = update }



{-Model-}

type alias Model =
    { name : String
    , password : String
    , passwordAgain : String
    }

model : Model

model =
    Model "" "" ""


{-Update-}

type Msg
    = Name String
    | Password String
    | PasswordAgain String

update : Msg -> Model -> Model

update msg model =
    case msg of
        Name name -> 
            { model | name = name }

        Password password ->
            { model | password = password }

        PasswordAgain passwordAgain -> 
            { model | passwordAgain = passwordAgain }

{-View-}


view : Model -> Html Msg

view model =
    div []
        [ input [ type_ "text", placeholder "Name", onInput Name ] []
        , input [ type_ "password", placeholder "Password", onInput Password] []
        , input [ type_ "password", placeholder "Re enter password", onInput PasswordAgain] []
        , viewValidation model
        , lengthValidation model
        ]

viewValidation : Model -> Html Msg

viewValidation model =
    let
        (color, message) =
            if model.password == model.passwordAgain then
                ("green", "ok")
            else 
                ("red", "Passwords do not match")
    in
        div[ style [("color", color)] ] [ text message ]


lengthValidation : Model -> Html Msg

lengthValidation model =
    let
        (color, message) =
            if String.length model.password < 8 then
                ("red", "password must have 8 digits")
            else
                ("green", "ok")
    in
        div[ style [("color", color)] ] [ text message ]
