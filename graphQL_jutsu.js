// Require axios to perform easy promise-based POST request
const axios = require('axios');
// Define constant
// Endpoint URL
const githubUrl = 'https://api.github.com/graphql'
// Your personal access token
const token = '2c35ade6b994a0a824ec2cfebdc3d2f1b2d2781a'
// The Authorization in the header of the request
const oauth = {Authorization: 'bearer ' + token}
// The GraphQL query, a string
const query = '{' +
    'search(query: "topic:custodian-collaboration org:MYOB-Technology", type: REPOSITORY, first: 100) {' +
      'edges {' +
        'node {' +
          '... on Repository {' +
            'nameWithOwner,' +
            'pushedAt,' +
            'sshUrl' +
          '}' +
        '}' +
      '}' +
    '}' +
  '}'

// Post request, axios.post() return a Promise
axios.post(githubUrl, {query: query}, {headers: oauth})
  .then(function (response) {
    // On success, print the response
    console.log(JSON.stringify(response.data, null, "  "));
  })
  .catch(function (error) {
    console.log(error);
  });