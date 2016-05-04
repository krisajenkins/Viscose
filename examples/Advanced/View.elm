module Advanced.View (root) where

import Advanced.Heroes.View
import Advanced.Types exposing (..)
import Advanced.Villains.View
import Dialog
import Html exposing (..)
import Html.Attributes exposing (..)
import Signal exposing (..)
import Utils exposing (..)


root : Address Action -> Model -> Html
root address model =
  let
    heroesAddress =
      forwardTo address HeroesAction

    villainsAddress =
      forwardTo address VillainsAction

    attackMessage =
      message address HeroAttack
  in
    div
      [ style [ ( "margin", "15px" ) ] ]
      [ bootstrap
      , div
          [ class "container-fluid" ]
          [ h1 [] [ text "Advanced Demo" ]
          , div
              [ class "row" ]
              [ div
                  [ class "col-md-6" ]
                  [ Advanced.Heroes.View.root heroesAddress attackMessage model.heroes ]
              , div
                  [ class "col-md-6" ]
                  [ Advanced.Villains.View.root villainsAddress model.villains ]
              ]
          , instructions
          , Maybe.oneOf
              [ (Advanced.Heroes.View.dialog heroesAddress model.heroes)
              , (Advanced.Villains.View.dialog villainsAddress model.villains)
              ]
              |> Dialog.view
          ]
      ]


instructions : Html
instructions =
  div
    []
    [ h2 [] [ text "Instructions" ]
    , div
        [ class "well" ]
        [ ul
            []
            [ li [] [ text "Each character in this demo is its own Elm component, with its own types, and its own update and view functions. None of them are aware of the others." ]
            , li [] [ text "Click on any of the character buttons to switch views - this shows each sub-component acting independently." ]
            , li [] [ text "Select Penguin and click his action button, 'Wark!' This shows a sub-component triggering the dialog." ]
            , li [] [ text "Select Batman and click his action button, 'Kapow!' This shows a sub-component triggering another sub-component's dialog." ]
            ]
        ]
    ]
