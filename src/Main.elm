module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes as A
import Html.Events as E
import Html.Lazy as Lazy
import Url


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = UrlRequested
        , onUrlChange = UrlChanged
        }


type alias Model =
    { key : Nav.Key
    , url : Url.Url
    , property : String
    }


init : flags -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    ( Model key url "modelInitialValue", Cmd.none )


type Msg
    = Msg1
    | Msg2
    | UrlRequested Browser.UrlRequest
    | UrlChanged Url.Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msg1 ->
            ( model, Cmd.none )

        Msg2 ->
            ( model, Cmd.none )

        UrlRequested urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            ( { model | url = url }
            , Cmd.none
            )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


header : Html Msg
header =
    let
        links = 
            [ "Home"
            , "About"
            ]

        buttons = 
            links |>
            List.map 
                (\name ->
                    a 
                        [ A.href ("/" ++ String.toLower name) 
                        , A.class "nav-button"
                        ] 
                        [ text name 
                        ]
                )
    in
    div 
        [ A.id "header" 
        ] 
        [ nav [ A.class "nav-list" ] buttons
        ]

view : Model -> Browser.Document Msg
view model =
    { title = "Application Title"
    , body =
        [ main_ []
            [ Lazy.lazy (\_ -> header) ()
            , div 
                [ A.id "content" ]
                [ text "Test" 
                ]
            ]
        ]
    }
