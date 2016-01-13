import { connect } from 'react-redux'

export default connect(state => state.seats)(({ seats, userSeats }) => (
  <SeatView seats={seats} userSeats={userSeats} />
))
