import api from 'app/api'
import { userLoginSuccess } from 'app/actions/session'

export const USER_REGISTRATION_REQUEST = 'USER_REGISTRATION_REQUEST'
export const USER_REGISTRATION_SUCCESS = 'USER_REGISTRATION_SUCCESS'
export const USER_REGISTRATION_FAILURE = 'USER_REGISTRATION_FAILURE'

export const userRegistrationRequest = (user) => ({ type: USER_REGISTRATION_REQUEST, user })
export const userRegistrationSuccess = (user) => ({ type: USER_REGISTRATION_SUCCESS, user })
export const userRegistrationFailure = (user, error) => ({ type: USER_REGISTRATION_FAILURE, user, error })

export const registerUser = (user) =>
  async (dispatch) => {
    try {
      dispatch(userRegistrationRequest(user))

      const { response, body } = await api('/users', 'POST', { user })

      if (response.status < 200 || response.status >= 300)
        throw new Error(`Bad status: ${response.status}`)

      dispatch(userRegistrationSuccess(user))
      dispatch(userLoginSuccess(body))
    }
    catch (e) {
      dispatch(userRegistrationFailure(user, e))
    }
  }
