@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'composition order view'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_GG_ORDER
as projection on ZI_GG_ORDER
{
    @Consumption.valueHelpDefinition: [{entity: {name: 'zc_gg_order_vh', element: 'OrderId' }, useForValidation: true }] 
    
    key Orderid,
    @Consumption.valueHelpDefinition: [{entity: {name: 'zc_gg_customer_vh', element: 'CustomerId' }, useForValidation: true }] 
    Customer,
    CustomerName,
    @Consumption.valueHelpDefinition: [{entity: {name: 'zc_gg_vendor_vh', element: 'VendorId' }, useForValidation: true }] 
    Vendor,
    VendorName,
    @Consumption.valueHelpDefinition: [{entity: {name: 'zc_gg_company_vh', element: 'CompanyId' }, useForValidation: true }] 
    Company,
    CompanyName,
    Usnam,
    /* Associations */
    _Itens: redirected to composition child zc_gg_order_it

}
