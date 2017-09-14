const google = require('google')
const fs = require('fs')
const path = require('path')

const dataPath = path.join(__dirname, '..', 'data.json')

google.resultsPerPage = 10

function search(term) {
    return new Promise((resolve, reject) => {
         google(term, (err, res) => {
             if (err) reject(err)
             else resolve(res.links)
         })
    })
}

const searchPhrase = process.argv[2]

var framerData = JSON.parse(fs.readFileSync(dataPath))
search(searchPhrase).then(links => {
    framerData.results = links
    framerData.searchPhrase = searchPhrase
    framerData.results[1] = framerData.customResults[0]
    framerData.results[3] = framerData.customResults[1]
    fs.writeFileSync(dataPath, JSON.stringify(framerData, null, 2))
});
