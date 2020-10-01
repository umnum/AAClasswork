import React from 'react';

const Tile = (props) => {

    let bomb = '\ud83d\udca3';
    let flag = '\ud83d\udea9';
    return <button onClick={() => props.update(props.tile)} key={`row: ${props.row} col: ${props.col}`} className="mineBlock">{props.tile.explored && props.tile.bombed ? bomb : ""}</button>
}

export default Tile;