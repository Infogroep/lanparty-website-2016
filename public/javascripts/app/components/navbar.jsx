import React from 'react'
import { connect } from 'react-redux'
import { Link } from 'react-router'

const NavItem = ({ to, visible = true, children }) =>
  <li><Link to={to}>{children}</Link></li>

export default connect((state) => state.app)(({ session: { signedIn }}) => (
  <nav id="navbar">
    <ul>
      <NavItem to="/">Home</NavItem>
      <NavItem to="/info">Info</NavItem>
      { signedIn ? <NavItem to="/tickets">Tickets</NavItem> : null }
    </ul>
  </nav>
))
