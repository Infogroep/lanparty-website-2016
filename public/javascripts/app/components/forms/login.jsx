import React from 'react'
import { FormattedMessage } from 'react-intl'
import { reduxForm } from 'redux-form'

const Form = ({ fields: { email, password }, handleSubmit }) => (
  <form onSubmit={handleSubmit}>
    <div>
      <FormattedMessage id="login.email" description="email field label in registration form" defaultMessage="Email address" />
      <input type="text" {...email} />
    </div>
    <div>
      <label><FormattedMessage id="login.password" description="password field label in registration form" defaultMessage="Password" /></label>
      <input type="password" {...password} />
    </div>

    <button onClick={handleSubmit}><FormattedMessage id="login.submit" description="submit button in registration form" defaultMessage="Login" /></button>
  </form>
)

export default reduxForm({
  form: 'login',
  fields: ['email', 'password']
})(Form)
