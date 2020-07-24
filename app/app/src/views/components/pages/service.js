import axios from 'axios';

const baseUrl = process.env.REACT_APP_BASE_URL;

function get(collection, searchString) {

    // Check if the service worker can be found. If it can't reload the page.
    // return fetch('http://192.168.100.130:5049/api/'+collection+'?searchString='+searchString);

    return axios.get(baseUrl + collection + '?searchString=' + searchString)
        .then(response => {
            return response
        });
}

/**
 * Function -- getById()
 * Use -- This function is used to get subcategories
 * @param {*} collection 
 * @param {*} id 
 * @param {*} searchString 
 */
function getById(collection, id, searchString) {
    return axios.get(baseUrl + collection + '?catId=' + id + '&searchString=' + searchString).then(response => {
        return response
    });
}

function getFile(url) {
    return axios({method:'get',url:url,responseType:'blob'})
        .then(response => {
            return response
        });
}


export {
    get,
    getById,
    getFile
}