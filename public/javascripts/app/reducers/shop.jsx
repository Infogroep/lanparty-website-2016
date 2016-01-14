import { STORE_ITEM_TREE_UPDATE_SUCCESS } from 'app/actions/shop'

export default (state = { storeItemTree: [] }, { type, storeItemTree }) => {
  switch (type) {
    case STORE_ITEM_TREE_UPDATE_SUCCESS:
      return {
        ...state,
        storeItemTree
      }

    default:
      return state
  }
}
