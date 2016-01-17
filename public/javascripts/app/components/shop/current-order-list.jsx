import React from 'react'
import { FormattedMessage } from 'react-intl'

const OrderItem = ({ item }) => (
  <tr>
    <td>{ item.amount }</td>
    <td>{ item.name }</td>
    <td>{ item.price }</td>
  </tr>
)

export default ({ order }) => (
  <section id="current-order-list">
    <h1><FormattedMessage id="orderList.title" description="order list title" defaultMessage="Your order" /></h1>
    <div className="main">
      <table className="orders">
        <tbody>
          { order.items.map((item) => <OrderItem item={item} />) }
          <tr>
            <td colspan="2"><FormattedMessage id="orderList.total" description="order list total" defaultMessage="Total:" /></td>
            <td>{ order.total_price }</td>
          </tr>
        </tbody>
      </table>
    </div>
  </section>
)