import React from 'react'
import RegistrationForm from 'app/components/forms/registration'

const handleSubmit = (data) => {
  console.log(data)
}

export default () => (
  <RegistrationForm onSubmit={handleSubmit} />
)
