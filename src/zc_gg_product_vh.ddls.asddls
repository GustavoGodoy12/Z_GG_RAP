@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value help products'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_GG_PRODUCT_VH as select from ZR_GG_PRODUCT
{
    @ObjectModel.text.element: [ 'Description' ]
    @EndUserText.label: 'Id Produto'
    key ProductId,
    
    @Semantics.text: true
    @EndUserText.label: 'Descrição do Produto'
    Description
}
group by
    ProductId,
    Description
