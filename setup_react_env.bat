@echo off

set /p UserInputPath="Enter Project name: "

call mkdir %~dp0\%UserInputPath%
call cd %~dp0\%UserInputPath%

set /p ServerPort="Enter the port you want your project to run on: "

echo initializing node package manager ...
call npm init

echo installing babel globally ...
call npm install -g babel
echo installing babel-cli globally ...
call npm install -g babel-cli
echo installing webpack  ...
call npm install webpack --save
echo installing webpack-dev-server ... 
call npm install webpack-dev-server --save
echo installing react  ...
call npm install react --save
echo installing react-dom ...
call npm install react-dom --save
echo installing babel-core ...
call npm install babel-core
echo installing babel-loader ...
call npm install babel-loader
echo installing babel-preset-react ...
call npm install babel-preset-react
echo installing babel-preset-es2015 ...
call npm install babel-preset-es2015

@echo var config = { > webpack.config.js
@echo    entry: './main.js',>> webpack.config.js
@echo    output: {>> webpack.config.js
@echo       path:'/',>> webpack.config.js
@echo       filename: 'index.js',>> webpack.config.js
@echo    },>> webpack.config.js
@echo    devServer: {>> webpack.config.js
@echo       inline: true,>> webpack.config.js
@echo       port: %ServerPort%>> webpack.config.js
@echo    },>> webpack.config.js
@echo    module: {>> webpack.config.js
@echo       loaders: [>> webpack.config.js
@echo          {>> webpack.config.js
@echo             test: /\.js?$/,>> webpack.config.js
@echo             exclude: /node_modules/,>> webpack.config.js
@echo            loader: 'babel-loader',>> webpack.config.js
@echo 				
@echo             query: {>> webpack.config.js
@echo                presets: ['es2015', 'react']>> webpack.config.js
@echo             }>> webpack.config.js
@echo          }>> webpack.config.js
@echo       ]>> webpack.config.js
@echo    }>> webpack.config.js
@echo }>> webpack.config.js
@echo module.exports = config; >> webpack.config.js


@echo ^<!DOCTYPE html^> > index.html
@echo ^<html lang = "en"^> >> index.html
@echo   ^<head^> >> index.html
@echo      ^<meta charset = "UTF-8"^> >> index.html
@echo     ^<title^>React App^</title^> >> index.html
@echo  ^</head^> >> index.html
@echo
@echo   ^<body^> >> index.html
@echo      ^<div id = "app"^>^</div^> >> index.html
@echo      ^<script src = "index.js"^>^</script^> >> index.html
@echo   ^</body^> >> index.html
@echo ^</html^> >> index.html


@echo import React from 'react'; > App.js
@echo class App extends React.Component { >> App.js
@echo   render() { >> App.js
@echo      return ( >> App.js
@echo         ^<div^> >> App.js
@echo            Hello World!!! >> App.js
@echo         ^</div^> >> App.js
@echo      ); >> App.js
@echo   } >> App.js
@echo } >> App.js
@echo export default App; >> App.js


@echo import React from 'react'; > main.js
@echo import ReactDOM from 'react-dom'; >> main.js
@echo import App from './App.js'; >> main.js
@echo ReactDOM.render(^<App /^>, document.getElementById('app')); >> main.js

call cls

echo ====================================================================================================
echo simple instructions to follow:
echo 1. Open the "package.json" file Let's add the start command into scripts object.
echo ----^> "start": "webpack-dev-server --hot" ^<----
echo 2. then run 'npm start' in cmd in your project folder
echo 3. go to your browser and paste this link localhost:%ServerPort%
echo ENJOY!

pause