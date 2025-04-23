@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value help company'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_GG_COMPANY_VH as select from ztgg_company
{

    @ObjectModel.text.element: ['Name']
        @EndUserText.label: 'Id da empresa'
    key company_id as CompanyId,
    
    @Semantics.text: true
    @EndUserText.label: 'Nome da empresa'
    name as Name
}
group by
company_id,
name
