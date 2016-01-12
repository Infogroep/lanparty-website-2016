import React from 'react'
import { FormattedMessage } from 'react-intl'
import { reduxForm } from 'redux-form'

const Form = ({ fields: { email, username, firstName, lastName, password, passwordConfirmation }, handleSubmit }) => (
  <form onSubmit={handleSubmit}>
    <div>
      <FormattedMessage id="register.email" description="email field label in registration form" defaultMessage="Email address" />
      <input type="text" {...email} />
    </div>
    <div>
      <FormattedMessage id="register.username" description="username field label in registration form" defaultMessage="Username" />
      <input type="text" {...username} />
    </div>
    <div>
      <label><FormattedMessage id="register.firstName" description="firstName field label in registration form" defaultMessage="First name" /></label>
      <input type="text" {...firstName} />
    </div>
    <div>
      <label><FormattedMessage id="register.lastName" description="lastName field label in registration form" defaultMessage="Last name" /></label>
      <input type="text" {...lastName} />
    </div>
    <div>
      <label><FormattedMessage id="register.password" description="password field label in registration form" defaultMessage="Password" /></label>
      <input type="password" {...password} />
    </div>
    <div>
      <label><FormattedMessage id="register.passwordConfirmation" description="passwordConfirmation field label in registration form" defaultMessage="Confirm password" /></label>
      <input type="password" {...passwordConfirmation} />
    </div>

    <button onClick={handleSubmit}><FormattedMessage id="register.submit" description="submit button in registration form" defaultMessage="Register" /></button>
  </form>
)

export default reduxForm({
  form: 'register',
  fields: ['email', 'username', 'firstName', 'lastName', 'password', 'passwordConfirmation']
})(Form)
