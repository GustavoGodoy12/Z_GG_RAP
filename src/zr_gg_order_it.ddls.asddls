@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'basic order itens view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GG_ORDER_IT as select from ztgg_order_it
{
    key order_id as OrderId,
    key item as Item,
    product as Product,
    @Semantics.quantity.unitOfMeasure: 'UnityMeasure'
    quantity as Quantity,
    unity_measure as UnityMeasure
}
