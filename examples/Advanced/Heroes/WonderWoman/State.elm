module Advanced.Heroes.WonderWoman.State exposing (initialCommands, initialModel, update)

import Advanced.Heroes.WonderWoman.Types exposing (Model, Msg(Swipe))


initialModel : Model
initialModel =
    { swordSwipes = 5999 }


initialCommands : Cmd Msg
initialCommands =
    Cmd.none


update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    case action of
        Swipe ->
            ( { model | swordSwipes = model.swordSwipes + 1 }
            , Cmd.none
            )
