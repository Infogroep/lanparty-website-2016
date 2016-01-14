import React from 'react'
import { connect } from 'react-redux'
import LoginForm from 'app/components/forms/login'
import { loginUser } from 'app/actions/session'

export default connect((state) => state)(({ dispatch }) => (
  <LoginForm onSubmit={({ email, password }) => dispatch(loginUser(email, password))} />
))
