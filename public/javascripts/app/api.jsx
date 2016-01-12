import fetch from 'isomorphic-fetch'

const csrfToken = document.querySelector('meta[name=csrf-token]').attributes.content.value

const underscore = (str) =>
  str.replace(/[A-Z]/g, (char, index) => (index !== 0 ? '_' : '') + char.toLowerCase())

const camelcase = (str) =>
  str.replace(/_[a-z]/g, (char, index) => char.substring(1).toUpperCase())

const createDeepKeyTransform = (transform) => {
  const recur = (obj) => {
    if (obj === null || typeof obj !== 'object')
      return obj

    return Object.keys(obj).reduce((result, key) => {
      result[transform(key)] = recur(obj[key])
      return result
    }, {})
  }
  return recur
}

const deepUnderscoreKeys = createDeepKeyTransform(underscore)
const deepCamelcaseKeys  = createDeepKeyTransform(camelcase)

export default async (url, method, body) => {
  const options = {
    method,
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'X-CSRF-Token': csrfToken
    },
    credentials: 'same-origin',
    body: body && JSON.stringify(deepUnderscoreKeys(body))
  }

  const response = await fetch(url, options)

  if (response.headers['Content-Type'] != 'application/json') {
    throw new Error('API should return JSON!')
  }

  return {
    response,
    body: deepCamelcaseKeys(JSON.parse(response.body))
  }
}
