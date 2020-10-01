const path = require('path')
module.exports = {
    entry: "./frontend/react_minesweeper.jsx",
    output: {
        path: path.resolve(__dirname),
        filename: "bundle.js"
    },
    resolve: {
        extensions: [".js", ".jsx","*"],
    },
    devtool: 'source-map',
    module:{
        rules: [
            {
            test: /\.jsx?$/,
            exclude: /(node_modules)/,
            use:{
                loader: 'babel-loader',

                query: {
                    presets: ['@babel/react', '@babel/env']
                }   
            } 
            }
        ]
    }

}