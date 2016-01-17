import React, { Component } from 'react'
import { connect } from 'react-redux'
import { updateStoreItemTree } from 'app/actions/shop'
import CurrentOrderList from 'app/components/shop/current-order-list'
import StoreItemList from 'app/components/shop/store-item-list'

class Shop extends Component {
  componentDidMount() {
    this.props.dispatch(updateStoreItemTree())
  }

  render() {
    return (
      <div>
        {this.props.currentOrder ? <CurrentOrderList order={this.props.currentOrder} /> : null}
        <StoreItemList tree={this.props.storeItemTree} />
      </div>
    )
  }
}

export default connect(state => state.app.shop)(Shop)
