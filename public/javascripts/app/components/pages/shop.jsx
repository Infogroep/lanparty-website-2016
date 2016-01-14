import React, { Component } from 'react'
import { connect } from 'react-redux'
import { updateStoreItemTree } from 'app/actions/shop'
import StoreItemList from 'app/components/shop/store-item-list'

class Shop extends Component {
  componentDidMount() {
    this.props.dispatch(updateStoreItemTree())
  }

  render() {
    return <StoreItemList tree={this.props.storeItemTree} />
  }
}

export default connect(state => state.app.shop)(Shop)
