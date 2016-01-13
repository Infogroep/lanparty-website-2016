import { USER_LOGIN_SUCCESS, USER_LOGOUT_SUCCESS } from 'app/actions/session'

export default (state = { signedIn: false, user: null }, { type, user }) => {
  switch (type) {
    case USER_LOGIN_SUCCESS:
      return {
        ...state,
        signedIn: true,
        user
      }

    case USER_LOGOUT_SUCCESS:
      return {
        ...state,
        signedIn: false,
        user
      }

    default:
      return state
  }
}
