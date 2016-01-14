import api from 'app/api'

export const STORE_ITEM_TREE_UPDATE_REQUEST = 'STORE_ITEM_TREE_UPDATE_REQUEST'
export const STORE_ITEM_TREE_UPDATE_SUCCESS = 'STORE_ITEM_TREE_UPDATE_SUCCESS'
export const STORE_ITEM_TREE_UPDATE_FAILURE = 'STORE_ITEM_TREE_UPDATE_FAILURE'

export const storeItemTreeUpdateRequest = () => ({ type: STORE_ITEM_TREE_UPDATE_REQUEST })
export const storeItemTreeUpdateSuccess = (storeItemTree) => ({ type: STORE_ITEM_TREE_UPDATE_SUCCESS, storeItemTree })
export const storeItemTreeUpdateFailure = (error) => ({ type: STORE_ITEM_TREE_UPDATE_FAILURE, error })

export const updateStoreItemTree = () =>
  async (dispatch) => {
    try {
      dispatch(storeItemTreeUpdateRequest())

      const { response, body } = await api('/store_items/tree', 'GET')

      if (response.status < 200 || response.status >= 300)
        throw new Error(`Bad status: ${response.status}`)

      dispatch(storeItemTreeUpdateSuccess(body))
    }
    catch (e) {
      dispatch(storeItemTreeUpdateFailure(e))
    }
  }
