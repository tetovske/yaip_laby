var output = document.getElementById('output-text');
function FindChild(e)
{
    console.log(e.tagName);
    output.innerHTML += ' ' + e.tagName;
    for (var i = e.firstElementChild; i != null; i = i.nextElementSibling)
        FindChild(i);
}