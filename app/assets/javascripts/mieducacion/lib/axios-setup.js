import axios from 'axios';
let csrf = document.querySelector('meta[name="csrf-token"]').getAttribute('content');


const httpClient = axios.create({
    timeout: 30000,
    headers: {
        common: {
            "X-CSRF-TOKEN": csrf
        }
    }
  });

  httpClient.interceptors.response.use(function (response) {
    if(response.status === 200 || response.status === 422) {
      return response;  
    }
  }, function (error) {
    if (error.response.status === 404) {
        AppRouter.replace('/not-found')
    }

    if (error.response.status === 500 || error.response.code === 502) {
        AppRouter.replace('/exception')
    }
    return Promise.reject(error);
  });


window.axios = httpClient
export default {
    axios: httpClient
}