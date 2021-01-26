{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
module Widgets where

import Foundation
import Yesod.Core

widgetCss :: Widget
widgetCss =
    toWidget
        [lucius|
            * {
                box-sizing: border-box;
            }

            body {
                font-family: Arial;
                margin: 0;
            }

            .header {
                padding: 60px;
                text-align: center;
                background: tomato;
                color: #333;
            }

            .navbar {
                display: flex;
                justify-content: flex-start;
                background-color: #333;
                align-items: flex-start; 
            }


            .navbar > a {
                justify-content: flex-start;
                color: tomato;
                padding: 14px 20px;
                text-align: center;
            }

            .navbar a:hover {
                background-color: #ddd;
                color: black;
            }


            .main {
                flex: 70%;
                background-color: white;
                padding: 20px;
                margin: 0 20%;
            }

            .footer {
                padding: 20px;
                text-align: center;
                background: #ddd;
            }

            @media screen and (max-width: 720px) {
            .navbar {
                flex-direction: column;
            }
                .main{
                    margin:0 5%;
                }
                .formdecontato{
                    margin:0 5%;
                }
                .caixatexto{
                    max-width: 100%
                }
                
            }


            input[type=text], select, textarea {
                width: 100%;
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 4px;
                resize: vertical;
            }

            label {
                padding: 12px 12px 12px 0;
                display: inline-block;
            }

            input[type=submit] {
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                float: right;
            }

            input[type=submit]:hover {
                background-color: #45a049;
            }

            .formdecontato{
                font-weight: bold;
                margin: 1% 20%;
            }

            #f{
                font-weight: normal;
            }
            #m{
                font-weight: normal;
            }

            video{
                width: 100%;
                height: 100%;
            }

            .texto{
                text-align: justify;
                text-justify: inter-word;
            }

            .caixatexto{
                max-width: 80%;
            }

            .img1{
                width: 50%;
                height: auto;
            }

            .img2{
                width: 50%;
                height: auto;
            }
        |]

widgetHead :: Widget
widgetHead =
    toWidget
        [hamlet|
            <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
        |]

widgetHeader :: Widget
widgetHeader =
    toWidget
        [hamlet|
            <div .header>
                <h1> Trabalho Framework Web YESOD
                <p> Página criada para o curso de Haskell e Yesod
            
            <div .navbar>
                <a href=@{HomeR}>Home
                <a href=@{VideosR}>Vídeos
                <a href=@{RlistR}>Lista de Restaurantes
        |]

widgetFooter :: Widget
widgetFooter =
    toWidget
        [hamlet|
            <div .footer>
                <p> Feito por Victor, João e Eduardo.
        |]
