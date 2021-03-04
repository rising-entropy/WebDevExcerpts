let count = 0
document.getElementById("add").onclick = function() {
    var form = document.getElementById("comps");
    var input = document.createElement("input");
    input.type = "text";
    let vari = "mate" + count.toString();
    input.setAttribute("id", vari);
    input.setAttribute("class", "form-control")
    count++;
    var br = document.createElement("br");
    form.appendChild(input);
    form.appendChild(br);
}
document.getElementById("sub").onclick = function() {
    var notes = "";
    for(let i=0; i<count; i++)
    {
        notes += document.getElementById("mate"+i.toString()).value;
        notes += " ";
    }
    document.getElementById("allMates").value = notes;
    console.log(notes);
}