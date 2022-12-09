import React from "react";


function NavBar(){
    return(
    <div >
        <span className="navleft">
        <h3>
            <a href="/account">MY ACCOUNT</a>
        </h3>
        </span>
        <span className="navright">
        <h3>
            "Hello your-name! Not your-name? <a href="/logout">Logout</a>
        </h3>
        </span>
    </div>
    )
}

export default NavBar;