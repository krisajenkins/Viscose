module Advanced.Villains.Joker.State exposing (initialCommands, initialModel, update)

import Advanced.Villains.Joker.Types
    exposing
        ( JokerState(Laughing, Screaming)
        , Model
        , Msg(Close, Shoot, TakeDamage)
        )


initialModel : Model
initialModel =
    { shots = 0
    , health = 50
    , state = Laughing
    }


initialCommands : Cmd Msg
initialCommands =
    Cmd.none


update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    case action of
        Shoot ->
            ( { model | shots = model.shots + 1 }
            , Cmd.none
            )

        TakeDamage ->
            ( { model
                | health = model.health - 1
                , state = Screaming
              }
            , Cmd.none
            )

        Close ->
            ( { model | state = Laughing }
            , Cmd.none
            )
