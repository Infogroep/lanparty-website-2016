import React from 'react'
import { Link } from 'react-router'

export default () => (
  <nav id="navbar">
    <ul>
      <li><Link to="/">Home</Link></li>
      <li><Link to="/info">Info</Link></li>
      <li><Link to="/register">Register</Link></li>
    </ul>
  </nav>
)
