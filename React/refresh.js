//const and let
const a = "Aubameyang";
let b = "Bernardo";


//Arrow Functions
function sayHello(){
    console.log(`Hello ${a}!`);
}
sayHello()

sayHello2 = ()=>{
    console.log(`Hello ${b}!`);
}

sayHello2();

console.log("")


//For Each
const c = ["Defender", "Midfielder", "Striker"];

c.forEach((pos)=>{
    console.log(pos);
})

console.log("");


//Map

console.log(c.map(position => position.toUpperCase()))

console.log("")


//Filter
players = [
    {id: 1, name: "Kevin"},
    {id: 2, name: "Kyle"},
    {id: 3, name: "Ross"}
];

const players2 = players.filter(player => player.id !== 3);

console.log(players2)



