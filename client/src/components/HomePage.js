import React from "react";
import PeopleHolder from "./PeopleHolder";
import PeopleCard from "./PeopleCard";
import NavBar from "./NavBar";

function HomePage(){
    const person1 = {
        id: 1,
        name: "Leia Organa",
        img:"https://upload.wikimedia.org/wikipedia/en/1/1b/Princess_Leia%27s_characteristic_hairstyle.jpg",
        height: 150,
        hairColor: "brown",
        skinColor: "light",
        eyeColor: "brown",
        birthYear:"19BBY" ,
        gender: "female",
        homeworld: "Mars"
    }
    const person2 = {
        id: 2,
        name: "C-3PO",
        img:"https://m.media-amazon.com/images/I/71LFpKcZjGL.jpg",
        height: 167,
        hairColor: "n/a",
        skinColor: "gold",
        eyeColor: "yellow",
        birthYear:"112BBY" ,
        gender: "male",
        homeworld: "Earth"
    }

    const ppl = [person1, person2]

    const randomPerson = ppl[Math.floor(Math.random() * ppl.length)]

    return(
        <div className="main-container">
            < NavBar />
            {/* <PeopleHolder ppl = { ppl }/> */}
            < PeopleCard randomPerson = {randomPerson}/>
        </div>
    )
}

export default HomePage;