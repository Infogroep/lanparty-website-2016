import React from 'react'
import Navbar from 'app/components/navbar'

export default ({ children }) => (
  <div id="app">
    <Navbar />
    { children }
  </div>
)
