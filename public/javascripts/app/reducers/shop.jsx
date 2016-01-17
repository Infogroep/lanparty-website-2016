import { combineReducers } from 'redux'
import currentOrder from 'app/reducers/shop/current-order'
import storeItemTree from 'app/reducers/shop/store-item-tree'

export default combineReducers({
  storeItemTree,
  currentOrder
})
