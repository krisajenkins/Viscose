module Advanced.Heroes.Batman.State exposing (initialCommands, initialModel, update)

import Advanced.Battle exposing (Attack(Punch))
import Advanced.Heroes.Batman.Types exposing (Model, Msg(Finished, Kapow))


initialModel : Model
initialModel =
    { kapows = 1000
    , showDialog = False
    }


initialCommands : Cmd Msg
initialCommands =
    Cmd.none


update : Msg -> Model -> ( ( Model, Cmd Msg ), Maybe Attack )
update action model =
    case action of
        Kapow ->
            ( ( { model
                    | kapows = model.kapows + 2
                    , showDialog = True
                }
              , Cmd.none
              )
            , Just Punch
            )

        Finished ->
            ( ( { model | showDialog = False }
              , Cmd.none
              )
            , Nothing
            )
