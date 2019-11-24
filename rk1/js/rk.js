$('document').ready(function() {
    initialization();
});

function initialization() {
    $('#input-button').click(function() {
        if ($('#input-field').val() != null && $('#input-field').val() !== "") {
            let strArray = parseString($('#input-field').val());
            let set = findVowels(strArray);
            $('#output').empty();
            if (set.size > 0) {
                for (let elem of set.values()) {
                    $('#output').append(`${elem} `);
                }
            } else {
                alert("Строка не содержит искомых элементов.");
            }
        } else {
            alert("Введена пустая строка.");
        }
    });
}

function parseString(str) {
    return str.trim().split(/\s/);
}

function findVowels(arr) {
    let vowels = ['a', 'e', 'i', 'o', 'u'];
    let vowelsInArray = new Set();
    arr.filter((str, index) => {
        if ((index + 1) % 2 == 0) {
            let s = str.toLowerCase();
            for (let i = 0; i < s.length; i++) {
                if (vowels.indexOf(s[i]) != -1) {
                    vowelsInArray.add(s[i]);
                }
            }
        }
    });
    return vowelsInArray;
}