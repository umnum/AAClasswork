import React from 'react';
import Tile from './tile';

const Board = (props) => {

    
    return (
        <div>
            {props.board.grid.map( (row,idx) => {
                return (
                    <div key={`row: ${idx}`}>
                        {row.map((col, idx2) => {
                        return <Tile tile={col} update={props.update} row={idx} col={idx2}/>
                        })}
                    </div>
                );
            }

            )}
        </div>
    );
}
    


export default Board;