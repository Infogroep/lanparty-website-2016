import React from 'react'
import Navbar from 'app/components/navbar'

export default ({ children }) => (
  <div>
    <Navbar />
    { children }
  </div>
)
