import React from 'react'
import { connect } from 'react-redux'
import RegistrationForm from 'app/components/forms/registration'
import { registerUser } from 'app/actions/registration'

export default connect((state) => state)(({ dispatch }) => (
  <RegistrationForm onSubmit={(user) => dispatch(registerUser(user))} />
))
