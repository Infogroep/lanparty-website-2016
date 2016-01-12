import React from 'react'
import ReactDOM from 'react-dom'
import { createStore, combineReducers, applyMiddleware } from 'redux'
import { Provider } from 'react-redux'
import { Router, Route, IndexRoute } from 'react-router'
import { createHistory } from 'history'
import { syncReduxAndRouter, routeReducer } from 'redux-simple-router'
import { IntlProvider } from 'react-intl'
import { reducer as formReducer } from 'redux-form'
import thunk from 'redux-thunk'
import App from 'app/components/app'
import Home from 'app/components/pages/home'
import Page from 'app/components/pages/page'
import Register from 'app/components/pages/register'

const reducer = combineReducers(Object.assign({}, {
  routing: routeReducer,
  form: formReducer
}))

const createStoreWithMiddleware = applyMiddleware(thunk)(createStore)
const store = createStoreWithMiddleware(reducer)
const history = createHistory()

syncReduxAndRouter(history, store)

const routes = (
  <IntlProvider>
    <Provider store={store}>
      <Router history={history}>
        <Route path="/" component={App}>
          <IndexRoute component={Home} />
          <Route path="/info" component={Page} text="Hello world!" />
          <Route path="/register" component={Register} />
        </Route>
      </Router>
    </Provider>
  </IntlProvider>
)

const attachToDom = () =>
  ReactDOM.render(routes, document.getElementById('root'))

if (document.readyState !== 'loading')
  setTimeout(attachToDom)
else
  document.addEventListener('DOMContentLoaded', attachToDom)
