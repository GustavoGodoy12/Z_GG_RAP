@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consuption order itens'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define view entity zc_gg_order_it
  as projection on zi_gg_order_it
{
  key OrderId,
  key Item,
      @ObjectModel.text.element: [ 'Description' ]
      @Consumption.valueHelpDefinition: [{ entity: { name: 'zc_gg_product_VH', element: 'ProductId' }, useForValidation: true }]
      Product,
      Description,
      Value,
      Currency,
      Quantity,
      SalesPrice,
      UnityMeasure,
      /* Associations */
      _Order: redirected to parent ZC_GG_ORDER,
      _Product
}
