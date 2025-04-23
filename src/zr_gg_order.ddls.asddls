@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'basic order view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GG_ORDER as select from ztgg_order
{
    key orderid as Orderid,
    customer as Customer,
    vendor as Vendor,
    company as Company,
    usnam as Usnam
}
