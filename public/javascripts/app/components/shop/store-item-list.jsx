import React from 'react'

const StoreItemsView = ({ items }) => (
  <table>
    <thead>
      <tr>
        <th>Name</th>
        <th>Stock</th>
        <th>Price</th>
      </tr>
    </thead>
    <tbody>
      {
        items.map((item) => (
          <tr>
            <td>{item.name}</td>
            <td>{item.stock}</td>
            <td>{item.price}</td>
          </tr>
        ))
      }
    </tbody>
  </table>
)

const StoreItemClassView = ({ itemClass }) => (
  <section>
    <h1>{ itemClass.name }</h1>
    <div className="main">
      { itemClass.items.length == 0 ? null : <StoreItemsView items={itemClass.items} /> }
      {
        itemClass.subclasses.map((subclass) => (
          <StoreItemClassView itemClass={subclass} />
        ))
      }
    </div>
  </section>
)

export default ({ tree }) => (
  <section className="store-item-list">
    {
      tree.map((itemClass) => (
        <StoreItemClassView itemClass={itemClass} />
      ))
    }
  </section>
)
