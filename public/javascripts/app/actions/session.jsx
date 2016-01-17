import api from 'app/api'

export const USER_LOGIN_REQUEST = 'USER_LOGIN_REQUEST'
export const USER_LOGIN_SUCCESS = 'USER_LOGIN_SUCCESS'
export const USER_LOGIN_FAILURE = 'USER_LOGIN_FAILURE'
export const USER_LOGOUT_SUCCESS = 'USER_LOGOUT_SUCCESS'

export const userLoginRequest = () => ({ type: USER_LOGIN_REQUEST })
export const userLoginSuccess = (user) => ({ type: USER_LOGIN_SUCCESS, user })
export const userLoginFailure = (error) => ({ type: USER_LOGIN_FAILURE, error })

export const loginUser = (email, password) =>
  async (dispatch) => {
    try {
      dispatch(userLoginRequest())

      const { response, body } = await api('/users/sign_in', 'POST', { user: { email, password }})

      if (response.status < 200 || response.status >= 300)
        throw new Error(`Bad status: ${response.status}`)

      dispatch(userLoginSuccess(body))
    }
    catch (e) {
      dispatch(userLoginFailure(error))
    }
  }

export const logoutUser = () =>
  async (dispatch) => {
    try {
      dispatch
    }
  }