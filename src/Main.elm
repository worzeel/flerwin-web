module Main exposing (main)

import Browser exposing (Document, UrlRequest)
import Browser.Navigation as Nav
import Html exposing (a, div, text)
import Html.Attributes exposing (href)
import Url exposing (Url)
import Url.Parser exposing ((</>))


main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = LinkClicked
        , onUrlChange = UrlChanged
        }


type Route
    = Home
    | About


type alias Model =
    { key : Nav.Key
    , route : Maybe Route
    }


type Msg
    = NoOp
    | LinkClicked UrlRequest
    | UrlChanged Url


urlParser : Url.Parser.Parser (Route -> a) a
urlParser =
    Url.Parser.oneOf
        [ Url.Parser.map Home <| Url.Parser.top
        , Url.Parser.map About <| Url.Parser.s "about"
        ]


init : () -> Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url key =
    ( { key = key, route = Url.Parser.parse urlParser url }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions mode =
    Sub.none


getTitle : Maybe Route -> String
getTitle name =
    let
        pageName =
            case name of
                Just Home ->
                    "Home"

                Just About ->
                    "About"

                Nothing ->
                    "Invalid"
    in
    "Flerwin - [" ++ pageName ++ "]"


view : Model -> Document Msg
view model =
    { title = getTitle model.route
    , body =
        [ div []
            [ div [] [ text "Some text" ]
            , div [] [ text <| getTitle model.route ]
            , div [] [ a [ href "/about" ] [ text "/about" ] ]
            ]
        ]
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key <| Url.toString url )

                Browser.External url ->
                    ( model, Nav.load url )

        UrlChanged url ->
            ( { model | route = Url.Parser.parse urlParser url }, Cmd.none )
