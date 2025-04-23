@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value help customer'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zc_gg_customer_VH as select from ztgg_customer
{
        @ObjectModel.text.element: ['Name']
        @EndUserText.label: 'Id cliente'
    key customer_id as CustomerId,
    
    @Semantics.text: true
    @EndUserText.label: 'Nome do cliente'
    name as Name
}
group by
customer_id,
name
