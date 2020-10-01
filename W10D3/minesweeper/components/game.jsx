// PHASE 1: Game:   sheiße
import React from 'react';
import * as Minesweeper from '../minesweeper';
import Board from './board';

export default class Game extends React.Component{
    constructor(){
        super();
        let gridSize = Math.floor((Math.random() * 20) + 5);
        let numBombs = Math.floor((Math.random() * (gridSize/2)) + 10);
        this.state = {
            board: new Minesweeper.Board(gridSize, numBombs)
            
        };
        this.state.board.plantBombs();


    }

    updateGame(tile) {
        tile.explore();
        this.setState({board: this.state.board})
    }

    render(){
        return (
        <div>
            <Board board={this.state.board} update={this.updateGame.bind(this)} />
        
        </div>
        )
    }

}