module Advanced.Heroes.Batman.View exposing (dialog, root)

import Advanced.Heroes.Batman.Types exposing (Model, Msg(Finished, Kapow))
import Dialog
import Html exposing (Html, div, h1, h2, text)
import Utils exposing (actionButton, attackButton, debuggingView)


root : Model -> Html Msg
root model =
    div []
        [ h2 [] [ text "Batman" ]
        , debuggingView model
        , attackButton Kapow "Kapow!"
        ]


dialog : Model -> Maybe (Dialog.Config Msg)
dialog model =
    if model.showDialog then
        Just
            { closeMessage = Just Finished
            , containerClass = Just "batman-modal-container"
            , header = Just (h1 [] [ text "Kapow!" ])
            , body = Just (text "Batman swipes at you!")
            , footer = Just (actionButton ( Finished, "OK" ))
            }
    else
        Nothing
