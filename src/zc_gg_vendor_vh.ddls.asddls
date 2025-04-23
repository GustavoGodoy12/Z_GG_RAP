@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value help vendor'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zc_gg_vendor_VH as select from ztgg_vendor
{

    @ObjectModel.text.element: ['Name']
        @EndUserText.label: 'Id Vendedor'
    key vendor_id as VendorId,
    
    @Semantics.text: true
    @EndUserText.label: 'Nome do vendedor'
    name as Name
}
group by
vendor_id,
name
