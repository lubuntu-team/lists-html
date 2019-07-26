#! /usr/bin/env node

var fs = require('fs');
var readline = require('readline');

var translationLines = [];

var readInterface = readline.createInterface({
    input: fs.createReadStream('./templates/translations'),
    output: process.stdout,
    console: false
});

readInterface.on('line', function(line) {
    translationLines.push(line);
});

readInterface.on('close', () => {
    replaceFile("templates/lubuntu-council-list-info-template.html", "list-info-out.html");
    replaceFile("templates/lubuntu-council-options-template.html", "list-options.html");
    replaceFile("templates/lubuntu-council-subscribe-template.html", "list-subscribe.html");
});

function replaceFile (infile, outfile) {

    fs.readFile(infile, 'utf8', function (err, data) {
    if (err) {
        return console.log(err);
    }

    //# var result = data.replace(/<MM\-([A-Za-z\-]+)>/g, '$1');

    for(i in translationLines) {
        var toFrom = translationLines[i].split('////');
        var to = toFrom[0];
        var from = toFrom[1];

        var pattern = new RegExp(to, 'gi');
        data = data.replace(pattern, from).replace(/\\n/g, "\n");
    }

    fs.writeFile(outfile, data, 'utf8', function (err) {
        if (err) return console.log(err);
    });
});
}