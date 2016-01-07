import React from 'react'
import ReactDOM from 'react-dom'
import { createStore, combineReducers } from 'redux'
import { Provider } from 'react-redux'
import { Router, Route, IndexRoute } from 'react-router'
import { createHistory } from 'history'
import { syncReduxAndRouter, routeReducer } from 'redux-simple-router'
import App from 'app/components/app'
import Home from 'app/components/home'
import Page from 'app/components/page'

const reducer = combineReducers(Object.assign({}, {
  routing: routeReducer
}))
const store = createStore(reducer)
const history = createHistory()

syncReduxAndRouter(history, store)

const routes = (
  <Provider store={store}>
    <Router history={history}>
      <Route path="/" component={App}>
        <IndexRoute component={Home} />
        <Route path="/info" component={Page} text="Hello world!" />
      </Route>
    </Router>
  </Provider>
)

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(routes, document.getElementById('root'))
})
