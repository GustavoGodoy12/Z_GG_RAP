@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'composition order view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZI_GG_ORDER as select from ZR_GG_ORDER
composition [1..*] of zi_gg_order_it as _Itens
association [1..1] to ZC_GG_COMPANY_VH as _Company on $projection.Company= _Company.CompanyId
association [1..1] to zc_gg_customer_VH as _Customer on $projection.Customer= _Customer.CustomerId
association [1..1] to zc_gg_vendor_VH as _Vendor on $projection.Vendor= _Vendor.VendorId
{
    key Orderid,
    Customer,
    _Customer.Name as CustomerName,
    Vendor,
    _Vendor.Name as VendorName,
    Company,
    _Company.Name as CompanyName,
    Usnam,
    _Itens,
    _Company,
    _Customer,
    _Vendor
}
