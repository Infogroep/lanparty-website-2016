import React from 'react'
import { FormattedMessage } from 'react-intl'
import { reduxForm } from 'redux-form'

const Form = ({ fields: { firstName, lastName, email }, handleSubmit }) => (
  <form onSubmit={handleSubmit}>
    <div>
      <label><FormattedMessage id="register.first_name" description="first_name field label in registration form" defaultMessage="First name" /></label>
      <input type="text" {...firstName} />
    </div>
    <div>
      <label><FormattedMessage id="register.last_name" description="last_name field label in registration form" defaultMessage="Last name" /></label>
      <input type="text" {...lastName} />
    </div>
    <div>
      <FormattedMessage id="register.email" description="email field label in registration form" defaultMessage="Email address" />
      <input type="text" {...email} />
    </div>

    <button onClick={handleSubmit}><FormattedMessage id="register.submit" description="submit button in registration form" defaultMessage="Register" /></button>
  </form>
)

export default reduxForm({
  form: 'register',
  fields: ['firstName', 'lastName', 'email']
})(Form)
