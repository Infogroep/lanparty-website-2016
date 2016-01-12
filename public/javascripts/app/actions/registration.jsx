import api from 'app/api'

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

      const { response } = await api('/users', 'POST', { user })

      if (response.status >= 200 && response.status < 300)
        dispatch(userRegistrationSuccess(user))
      else
        dispatch(userRegistrationFailure(user, `Bad status: ${response.status}`))
    }
    catch (e) {
      dispatch(userRegistrationFailure(user, e))
    }
  }
